# **Índice**

<span style="color:black;">1. [ Introducción](#introducción)</span><br>
<span style="color:black;">2. [ Desarrollo del contenedor](#Desarrollo)</span><br>
<span style="color:black;">3. [ Desarrollo y configuración de FTP](#ftp)</span><br>
<span style="color:black;">4. [ Desarrollo de las webs](#Desarrollo2)</span><br>
<span style="color:black;">5. [ Problemas encontrados en el desarrollo](#Problemas)</span><br>

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



<h1 name="Desarrollo2">4. Desarrollo de las webs</h1>


<h1 name="Problemas">5. Problemas encontrados en el desarrollo</h1>


<h1 name="">6. </h1>

