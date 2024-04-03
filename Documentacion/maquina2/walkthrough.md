# Walkthrough

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



![](/Assets/walkthrough2/2024-03-21_18-07.png)

![](/Assets/walkthrough2/2024-04-02_17-51.png)

![](/Assets/walkthrough2/2024-04-02_17-51_1.png)

![](/Assets/walkthrough2/2024-04-02_17-52.png)

![](/Assets/walkthrough2/2024-04-02_17-54.png)

![](/Assets/walkthrough2/2024-04-02_17-55.png)

![](/Assets/walkthrough2/2024-04-02_18-03.png)

![](/Assets/walkthrough2/2024-04-02_18-09.png)

![](/Assets/walkthrough2/2024-04-02_18-14.png)

![](/Assets/walkthrough2/2024-04-02_18-15.png)

![](/Assets/walkthrough2/2024-04-02_18-16.png)

![](/Assets/walkthrough2/2024-04-02_18-40.png)

![](/Assets/walkthrough2/2024-04-02_18-41.png)

![](/Assets/walkthrough2/2024-04-02_18-42.png)

![](/Assets/walkthrough2/2024-04-03_16-24.png)

![](/Assets/walkthrough2/2024-04-03_16-24_1.png)

![](/Assets/walkthrough2/2024-04-03_16-28.png)

![](/Assets/walkthrough2/2024-04-03_16-36.png)

![](/Assets/walkthrough2/2024-04-03_16-49.png)

![](/Assets/walkthrough2/2024-04-03_17-27.png)

![](/Assets/walkthrough2/2024-04-03_17-00.png)

![](/Assets/walkthrough2/2024-04-03_17-39.png)