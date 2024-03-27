# Creación máquina 2

Para esta máquina vamos a usar la imagen de ubuntu:lastest, ya que es la más completa y era necesario para esta máquina.

A parte de esta imagen vamos a necesitar algunos paquetes adicionales:

- Samba
- Telnet
- Papercut
- Crontab

Todos los paquetes se instalan con *apt install* menos el de papercut.

## Papercut

PaperCut es una herramienta de gestión de impresión que controla y administra el uso de impresoras en entornos empresariales, permitiendo monitorear, establecer políticas y asignar costos.

----

Hemos usado una versión en concreto, ya que tiene un fallo de software que te permite acceder al panel de administrador saltándote el login. Hemos instalado los paquetes del repositorio original de [PaperCut](https://cdn.papercut.com/web/products/ng-mf/installers/ng/18.x/pcng-setup-18.3.9.49588.sh), en este caso la versión 18.3, ya que está afectada por el CVE-2023-27350.
Este CVE consiste principalmente en hacer un bypass al panel de login. Explotar esta vulnerabilidad es muy fácil, ya que solo tenemos que añadir el siguiente contenido a la URL -/app?service=page/SetupCompleted** esto nos redirige al último paso de la instalación y nos permite acceder al panel de control.

Dentro de este panel de control hay ocultos un usuario y una contraseña de la máquina. Con este usuario **thegrefg**, podemos acceder a la máquina por telnet.

Una vez dentro de telnet con este usuario no tienes acceso a nada, pero si miras los puertos que tiene la máquina en escucha verás que tiene el puerto 445 en escucho, *el puerto smb*, puerto que desde fuera de la máquina no tienes acceso, ya que solo está en escucha de 127.0.0.1, para ello hemos hecho la siguiente configuración en el archivo */etc/samba/smb.conf*.

![](/Assets/localhostsmb.png)

También hemos añadido un recurso compartido

![](/Assets/videos.png)

Este recurso tiene varias configuraciones:
1. Un comentario, que es una pista.
2. La ruta local del recurso compartido
3. Y el último importante es valid users, ya que solo tiene acceso lolito

Para acceder a este recurso tienes que entrar como lolito, usuario del cual no se tiene la contraseña y se tiene que hacer fuerza bruta, pero claro desde al máquina víctima no podemos hacer fuerza bruta, así que estamos obligando al atacante a usar chisel o alguna herramienta de port forwarding.

Una vez dentro del recurso compartido se observa lo siguiente.

![](/Assets/comp.png)

Encontramos una lista de juegos, la cual tenemos que usar para hacer fuerzbruta por telnet al usuario lolito, ya que la contraseña de samba y la de telnet no es la misma. Una vez hecha la fuerzabruta y dentro de la máquina vemos que en la home de lolito tenemos un script de Python.

![](/Assets/script1.png)

Este script es el juego del ahorcado. Para hacer el movimiento lateral usando este script hemos cambiado donde Python busca las librerías, y hemos añadido la home de lolito como primer path.

''export PYTHONPATH=/home/lolito:$PYTHONPATH''

De esta manera como el script usa varias librerías, si añadimos un archivo con el mismo nombre podemos ejecutar comandos en Python, y al poder ejecutar el script como otro usuario podemos hacer movimiento lateral. Para poder ejecutar comandos como otra persona tenemos que añadir lo siguiente el fichero /etc/sudoers:

![](/Assets/sudoers.png)

Con esto podemos llegar al usuario ampeter, que ya es el último antes que root.
Para llegar a root desde este usuario lo que hemos hecho, es un script que comprime la home de ampeter con un script que se ejecuta cada minuto con una tarea de cron.

Hemos creado un script que con el comando tar cea un archivo comprimido de todos los documentos que se encuentran en la home de ampeter.

![](/Assets/scriptcompress.png)

Tambien hemos creado una tarea con cron para que se ejecute automáticamente cada minuto.

![](/Assets/cron.png)

Es importante reiniciar el servicio cron, si no no se ejecuta la tarea.

![](/Assets/resetcron.png)

```` Por medio de esta tarea podemos llegar a root y completar la máquina. ````