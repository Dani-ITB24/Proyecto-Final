# Walkthrough

https://forms.gle/HVEMKHVRdZmjABqh9

## Recognition

Empezamos haciendo un nmap para descubrir los puertos abiertos. Vemos que tiene 5 puertos abiertos, uno es telnet por el puerto 23 y los otros no sabemos lo que son, así que vamos a investigar.

![](/Assets/walkthrough2/2024-03-21_17-03.png)

Si accedemos al puerto 9191 por el navegador podemos ver que se trata de un servidor PaperCut, que es un administrador de impresoras e impresiones.

![](/Assets/walkthrough2/2024-03-21_17-05.png)

Intentamos iniciar sesión con credenciales por defecto, pero no hay suerte. Como no podemos iniciar sesión vamos a buscar a ver si la versión de PaperCut 18.3 es vulnerable.

![](/Assets/walkthrough2/2024-03-21_17-08.png)

Encontramos un CVE relacionado con PaperCut.

![](/Assets/walkthrough2/2024-03-21_17-14.png)

Este CVE nos permite saltar el paso de inicio de sesión.

![](/Assets/walkthrough2/2024-03-21_17-14_1.png)

Si vemos el siguiente código podemos ver que solo nos hace falta el enlace, así que vamos a probarlo.

![](/Assets/walkthrough2/2024-03-21_17-17.png)

Lo pegamos en el navegador y vemos que nos lleva a la página que nos sale cuando acabamos de hacer la instalación del servidor, así que parece que ha funcionado.

![](/Assets/walkthrough2/2024-03-21_17-21.png)

Ha funcionado bien, estamos dentro del servidor PaperCut.

![](/Assets/walkthrough2/2024-03-21_17-21_1.png)

Vemos que el servidor tiene diferentes secciones en la barra lateral, así que vamos a ir mirando si encontramos algo interesante. Si entramos en users solo vemos los usuarios, _apt, papercut y root. Nada interesante por el momento.

![](/Assets/walkthrough2/2024-03-21_17-31.png)

En el apartado "Devices" parece que vemos algo interesante, un "device\Impresora-Grail", pero no tenemos forma de acceder.

![](/Assets/walkthrough2/2024-03-21_17-32.png)

Vamos a abrir "Inspeccionar elemento" y vamos a quitar el div que no nos deja acceder a la impresora para ver si así podemos interactuar con ella.

![](/Assets/walkthrough2/2024-03-21_17-35.png)

Ahora que hemos eliminado ese div somos capaces de interactuar con la impresora. Accedemos a la impresora.

![](/Assets/walkthrough2/2024-03-21_17-38.png)

Volvemos a hacer lo mismo con "Inspeccionar elemento".

![](/Assets/walkthrough2/2024-03-21_17-39.png)

Ahora que ya podemos ver el contenido de forma más clara podemos ver que hay un usuario y una contraseña.

![](/Assets/walkthrough2/2024-03-21_17-42.png)

Cambiamos el modo de la contraseña de "password" a "text" para poder ver la contraseña en texto plano. Vemos que el usuario es "thegrefg" y la contraseña "Never_surR3nder". Ahora que tenemos unas credenciales, vamos a probar de iniciar sesión por telnet.

![](/Assets/walkthrough2/2024-03-21_17-43.png)

Las credenciales son válidas para iniciar sesión en telnet.

![](/Assets/walkthrough2/2024-03-21_17-49.png)

Investigamos formas de hacer escalada de privilegios o movimiento lateral, pero no encontramos nada, así que vamos a ver si hay algún servicio corriendo solamente en local. Como podemos ver encontramos el servidor smb corriendo en local.

![](/Assets/walkthrough2/2024-03-21_17-53.png)

Listamos los recursos compartidos sin autenticarnos con "smbclient". Vemos que hay un recurso compartido llamado "videos" que parece interesante, así que vamos a ver donde está ubicado y vamos a intentar acceder. Con el usuario thegrefg no podemos acceder a ese recurso compartido.

![](/Assets/walkthrough2/2024-04-02_17-31.png)

Accedemos a la ruta del recurso compartido, pero no tenemos permisos. El propietario del archivo es lolito y él es el único que tiene permisos sobre el archivo, así que vamos a hacer port forwarding con chisel a smb para poder hacer un ataque de fuerza bruta.

![](/Assets/walkthrough2/2024-03-21_18-07.png)

Nos descargamos el binario de chisel y abrimos un servidor http con python3.

![](/Assets/walkthrough2/2024-04-02_17-51.png)

Nos descargamos chisel en máquina víctima y le damos permisos de ejecución.

![](/Assets/walkthrough2/2024-04-02_17-51_1.png)

En nuestra máquina atacante, nos ponemos en escucha con chisel por el puerto 5678

![](/Assets/walkthrough2/2024-04-02_17-52.png)

En la máquina víctima, establecemos la conexión con la máquina servidor y de esta forma redirigimos todo el tráfico del puerto 445 de la máquina víctima, para que vaya al puerto 445 de la máquina atacante.

![](/Assets/walkthrough2/2024-04-02_17-54.png)

Como podemos ver se ha establecido la conexión correctamente. Ahora vamos a utilizar msfconsole para hacer un ataque de fuerza bruta a smb.

![](/Assets/walkthrough2/2024-04-02_17-55.png)

Seleccionamos el módulo auxiliar "scanner/smb/smb_login", y especificamos nuestro usuario objetivo, ip objetivo, la wordlist que vamos a usar y que cuando encuentre las credenciales que pare de buscar.

![](/Assets/walkthrough2/2024-04-02_18-03.png)

Vemos que la contraseña de lolito para smb es lamborghini.

![](/Assets/walkthrough2/2024-04-02_18-09.png)

Intentamos iniciar sesión por telnet para ver si hay suerte, pero parece que estas credenciales solo sirven para smb.

![](/Assets/walkthrough2/2024-04-02_18-14.png)

Ahora que ya tenemos las credenciales de lolito nos descargamos el recurso compartido en smb.

![](/Assets/walkthrough2/2024-04-02_18-15.png)

El archivo contiene muchos nombres de videojuegos, y parece una wordlist, así que vamos a probar de hacer nuevamente fuerza bruta a lolito pero ahora en telnet.

![](/Assets/walkthrough2/2024-04-02_18-16.png)

Seleccionamos el módulo auxiliar "scanner/telnet/telnet_login", y especificamos nuestro usuario objetivo, ip objetivo, la wordlist que vamos a usar y que cuando encuentre las credenciales que pare de buscar.

![](/Assets/walkthrough2/2024-04-02_18-40.png)

Vemos que la contraseña de lolito para telnet es Valorant.

![](/Assets/walkthrough2/2024-04-02_18-41.png)

Iniciamos sesión con lolito por telnet.

![](/Assets/walkthrough2/2024-04-02_18-42.png)

Probamos de hacer un sudo -l para ver si tenemos algun permiso para ejecutar algun comando como root. Vemos que tenemos permisos de ejecutar un script que esta en nuestra home, y lo podemos ejecutar como ampeter.

![](/Assets/walkthrough2/2024-04-03_16-28.png)

Cuando ejecutamos el script se nos inicia una especie de juego que se parece al ahorcado. No podemos modificarlo, ya que no tenemos permisos.

![](/Assets/walkthrough2/2024-04-03_16-24.png)

Si miramos el script por dentro vemos que importa 3 librerias distintas, así que podemos mirar la lista de rutas de búsqueda de módulos de python que python utiliza para encontrar módulos importados.

![](/Assets/walkthrough2/2024-04-03_16-24_1.png)

Creamos el script y lo ejecutamos. Vemos que el primer lugar donde mira python es nuestra home, así que vamos a aprovechar y vamos a crear un archivo que se llame igual que la librería para que ejecute nuestro script primero y así hacer el movimiento lateral.

![](/Assets/walkthrough2/2024-04-03_16-36.png)

Creamos un script que ejecuta un shell. Al ejecutar el script como usuario ampeter nos convertimos en ampeter.

![](/Assets/walkthrough2/2024-04-03_16-49.png)

Ahora que somos ampeter vamos a la home de ampeter. Encontramos la flag de user y un script en bash que hace un backup comprimiendo todos los archivos de la home de ampeter con tar. Al ser un script que hace backups, lo más seguro se ejecute automáticamente con alguna cronjob.

![](/Assets/walkthrough2/2024-04-03_17-27.png)

Investigando un poco, encontramos una tarea que ejecuta el script del backup cada minuto por root, así que vamos a hacer una ejecución arbitraria de comandos a tar, ya que tar tiene parámetros por los cuales se puede tener la capacidad de ejecutar comandos.

![](/Assets/walkthrough2/2024-04-03_17-00.png)

Concretamente, para tar, podemos hacer uso de los parámetros de la imagen, donde en “ACTION” usaremos “exec” para ejecutar un comando externo dado. Una vez creados los comandos, esperamos 1 minuto y ya somos capaces de hacer sudo su. Ya somos root y podemos acceder a la flag de root.

![](/Assets/walkthrough2/2024-04-03_17-39.png)