# **Índice**

<span style="color:black;">1. [ Introducción](#introducción)</span><br>
<span style="color:black;">2. [ Desarrollo del contenedor](#Desarrollo)</span><br>
<span style="color:black;">3. [ Desarrollo y configuración de FTP](#ftp)</span><br>
<span style="color:black;">4. [ Desarrollo de las webs](#Desarrollo2)</span><br>
<span style="color:black;">5. [ Problemas encontrados en el desarrollo](#Problemas)</span><br>
<span style="color:black;">6. [ ](#)</span><br>

---

<br>

<h1 name="introducción">1. Introducción</h1>
Para desarrollar el contenedor Docker, se ha tenido en cuenta que debe ser vulnerable al ataque A06:2021 - Componentes vulnerables y desactualizados. Para que nuestro contenedor sea vulnerable frente al anterior ataque, hemos optado por no utilizar la última versión de Ubuntu, así que montaremos el contenedor con un Ubuntu 20.04 como base.


<h1 name="Desarrollo">2. Desarrollo del contenedor</h1>
El contenedor Docker estará basado en Ubuntu 20.04 Server y tendrá instalados los siguientes programas:
<ul>
  <li>Wireshark, el cual nos permitirá realizar una captura de red mientras se ejecuta el ataque. Esta captura será analizada posteriormente.</li> 
  <li>Apache, nos permitirá tener un servidor web alojado en Docker.</li> 
  <li>VSFTPD, servidor FTP para acceder a recursos y archivos del sistema.</li> 
  <li>X11, esta utilidad nos permite utilizar Wireshark de forma gráfica desde el contenedor Docker.</li> 
  <li>VIM/NANO, editores de texto.</li> 
</ul>

El Dockerfile que generará el contenedor es el siguiente:
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/dockerfile.png)\
En la primera línea se específica que imagen se usará para montar el contenedor, después se realiza una actualización de paquetes y se instalan las utilidades necesarias para hacer el contenedor vulnerable frente a la A06:2021, el parámetro **DEBIAN_FRONTEND=noninteractive** se utiliza para que a la hora de instalar los paquetes no aparezca ningún prompt y que se aplique la opción predeterminada a la hora de configurar los paquetes en la instalación, la última línea **rm -rf /var/lib/apt/lists/** eliminará los archivos temporales que ya no son necesarios después de la instalación de los paquetes, de esta forma se optimiza el espacio del contenedor. A continuación se crea el directorio sshd dentro de /var/run, esto se realiza de forma automática a la hora de poner en marcha el servicio SSH sin embargo es mejor crearlo antes de poner en marcha el servicio por si se necesita de antemano. A continuación se establece que la variable de entorno **DISPLAY** apunte al display de la máquina anfitrión, esto nos servirá para poder usar Wireshark de forma gráfica. Por último se abren los puertos necesarios para los servicios de SSH, FTP y Apache y se ponen en marcha dichos servicios.


<h1 name="ftp">3. Desarrollo y configuración de FTP</h1>


La configuracion del ftp tendra estos permisos habilitados:

> xferlog_enable=YES

Con esta opción habilitada el servidor FTP comenzará a registrar información sobre las transferencias de archivos en las cuales será guardada en un archivo de registro. Esto registrará desde una descarga (GET), una subida (PUT), el usuario que realizo la acción, etc.

<h1 name="Desarrollo2">4. Desarrollo de las webs</h1>


<h1 name="Problemas">5. Problemas encontrados en el desarrollo</h1>

Se intentó instalar la versión 2.3.4 de vsftpd para aprovechar la vulnerabilidad [CVE-2011-2523](https://www.exploit-db.com/exploits/49757). Para empezar esta versión no se puede instalar directamente con apt, así que había que descargarla desde github u otro recurso de internet, y posteriormente instalarla. Nos encontramos con fallos al intentar hacer el **make** de esta versión de vsftpd.
<br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/ftp_error3.png)

Había que añadir "**-lcrypt**" en una línea del makefile de vsftpd para poder hacer el **make**. Tras instalar las dependencias necesarias e instalar vsftpd, no hubo manera de iniciar el servicio.
<br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/ftp_error.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/ftp_error2.png)


<h1 name="">6. </h1>

