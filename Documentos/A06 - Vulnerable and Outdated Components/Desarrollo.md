# **Índice**

<span style="color:black;">1. [ Introducción](#introducción)</span><br>
<span style="color:black;">2. [ Desarrollo del contenedor](#Desarrollo)</span><br>
<span style="color:black;">3. [ Desarrollo y configuración de FTP](#ftp)</span><br>
<span style="color:black;">4. [ Desarrollo del login - Apache](#weblogin)</span><br>
<span style="color:black;">5. [ Desarrollo de la web Tomcat](#webtomcat)</span><br>
<span style="color:black;">6. [ Escalado de privilegios](#Escalado)</span><br>
<span style="color:black;">7. [ Problemas encontrados en el desarrollo](#Problemas)</span><br>
<span style="color:black;">8. [ Actualizaciones](#Actualizaciones)</span><br>

---

<br>

<h1 name="introducción">1. Introducción</h1>
Para desarrollar el contenedor Docker, se ha tenido en cuenta que debe ser vulnerable al ataque A06:2021 - Componentes vulnerables y desactualizados. Para que nuestro contenedor sea vulnerable frente al anterior ataque, hemos optado por no utilizar la última versión de Ubuntu, así que montaremos el contenedor con un Ubuntu 20.04 como base.


<h1 name="Desarrollo">2. Desarrollo del contenedor</h1>
El contenedor Docker estará basado en Ubuntu 20.04 Server y tendrá instalados los siguientes programas:
<ul>
  <li>Wireshark, el cual nos permitirá realizar una captura de red mientras se ejecuta el ataque. Esta captura será analizada posteriormente.</li> 
  <li>SSH, servidor openSSH para la conexión remota con el contenedor.</li>
  <li>Apache, nos permitirá tener un servidor web alojado en Docker.</li> 
  <li>VSFTPD, servidor FTP para acceder a recursos y archivos del sistema.</li> 
  <li>X11, esta utilidad nos permite utilizar Wireshark de forma gráfica desde el contenedor Docker.</li> 
  <li>VIM/NANO, editores de texto.</li>
  <li>SUDO, para poder realizar el escalado de privilegios</li>
  <li>Tomcat, servicio web vulnerable para poder realizar el ataque</li>
</ul>

El Dockerfile que generará el contenedor es el siguiente: 
<br>
Dockerfile:
<br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/dockerfile.png)
<br>

En la primera línea se específica que imagen se usará para montar el contenedor, después se realiza una actualización de paquetes y se instalan las utilidades necesarias para hacer el contenedor vulnerable frente a la A06:2021, el parámetro **DEBIAN_FRONTEND=noninteractive** se utiliza para que a la hora de instalar los paquetes no aparezca ningún prompt y que se aplique la opción predeterminada a la hora de configurar los paquetes en la instalación, la última línea **rm -rf /var/lib/apt/lists/** eliminará los archivos temporales que ya no son necesarios después de la instalación de los paquetes, de esta forma se optimiza el espacio del contenedor. A continuación se crea el directorio sshd dentro de /var/run, esto se realiza de forma automática a la hora de poner en marcha el servicio SSH sin embargo es mejor crearlo antes de poner en marcha el servicio por si se necesita de antemano. A continuación se realiza la instalación del servicio Tomcat, para ello descargaremos y descomprimimos la version 9.0.30 despues movemos la carpeta a /opt/tomcat que es donde suele encontrarse este servicio. Se abren los puertos necesarios para los servicios de SSH, FTP, Apache Y Tomcat. Y por ultimo se copia en el directorio **/usr/local/bin** el script **start_services.sh** el cual se utiliza para poner en marcha los servicios FTP, SSH, Apache2 y Tomcat, se le añadiran permisos de ejecucion al script y con la utilidad **CMD** de docker ejecutaremos el script de esta forma nos asegurarnos de que los servicios se inician al poner el contenedor en marcha. 

<br>

start_services.sh:
<br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/start_services.sh.png)

<br>
<h1 name="ftp">3. Desarrollo y configuración de FTP</h1>


La configuracion del ftp tendra estos permisos habilitados:

- Con la opción "xferlog_enable" habilitada el servidor FTP comenzará a registrar información sobre las transferencias de archivos en las cuales será guardada en un archivo de registro. Esto registrará desde una descarga (GET), una subida (PUT), el usuario que realizo la acción, etc.
> xferlog_enable=YES

- Con esta opción habilitada en el servidor permite al usuario acceder al servidor FTP de forma que no sea necesario la autentificación.
> anonymous_enable=YES 

- Con esta opción habilitada en el servidor permitiremos que los usuarios que hayan accedido al servidor FTP de forma anónima puedan subir sus propios archivos al servidor
> anon_upload_enable=YES 

- Estas opciones de listen hacen que el servidor FTP únicamente escuche a través de las interfaces de red disponibles y solamente desde IPV4. Esto significa que el servidor FTP solo aceptará conexiones en IPv4 a través de las interfaces de red disponibles en el sistema, ignorando cualquier interfaz IPv6 que pueda estar presente.
> listen=YES \
> listen_ipv6=NO 

- Habilitando este permiso en el servidor permitimos que los usuarios tengan los permisos necesarios para poder compartir, editar contenido existente o administrar los archivos.
> write_enable=YES

- Por ultimo aplicaremos una mascara de permisos para que cualquier archivo que se suba con usuario anonymous tenga permisos de lectura y escritura para el propietario grupos y otros. De esta forma podremos ejecutar una reverse-shell via web. 
> anon_umask=022

<h1 name="weblogin">4. Desarrollo del login - Apache</h1>

**Web login** <br>
Se ha realizado el desarrollo de un login falso para la página web con la temática de la empresa Tu1millon. Para la creación de la página, se ha utilizado HTML y CSS. No es una página funcional, la función es distraer a los atacantes.
<br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/index.html.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/style.css.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/tu1millon-web.png)

<br>


<h1 name="webtomcat">5. Desarrollo de la web Tomcat</h1>

Durante la creación del contenedor de docker se realizan las siguientes acciones para la configuración del TomCat: 

Se realiza la descarga del TomCat 
> wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz  

Se descomprime el programa TomCat. Y mueve la carpeta de instalación a /opt/tomcat que es donde suele encontrarse este servicio. 
> tar –xzf apache-tomcat-9.0.30.tar.gz \
> mv apache-tomcat-9.0.30 /opt/tomcat 

Se expone el puerto 8080, que es el puerto predeterminado de Tomcat para las solicitudes HTTP. 
> Expose 8080 

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/config-tomcat1.png)

Después se copia el script llamado **start_services.sh** que con este script se iniciarán los servicios necesarios dentro del contenedor. 

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/config-tomcat2.png)

Luego por último estableceremos permisos de ejecución al script para que se inicien lo servicios automáticamente cuando se inicie el contenedor.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/config-tomcat3.png)

<br>

<h1 name="Escalado">6. Escalado de privilegios</h1>

Dentro de los archivos creados por TomCat guardaremos el nombre de usuario y la contraseña cifrada en Base64 del usuario vulnerable.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/cuentaUser-vuln.png)

El siguiente paso será crear el usuario vulnerable “Pepe” y añadimos la contraseña sin cifrar.  
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/creacion-userPepe.png)

Y ya por últimoa accedemmos a  **/etc** y modificamos el archivo sudoers. Ahí añadiremos una linea para el ususario pepe, de esta forma podra ejecutar el binario vim utilizando **sudo sin contraseña**.
>pepe ALL=(ALL) NOPASSWD: /usr/bin/vim

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/permisosPepe.png)
<br>

<h1 name="Problemas">7. Problemas encontrados en el desarrollo</h1>

Se intentó instalar la versión 2.3.4 de vsftpd para aprovechar la vulnerabilidad [CVE-2011-2523](https://www.exploit-db.com/exploits/49757). Para empezar esta versión no se puede instalar directamente con apt, así que había que descargarla desde github u otro recurso de internet, y posteriormente instalarla. Nos encontramos con fallos al intentar hacer el **make** de esta versión de vsftpd.
<br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/ftp_error3.png)

Había que añadir "**-lcrypt**" en una línea del makefile de vsftpd para poder hacer el **make**. Tras instalar las dependencias necesarias e instalar vsftpd, no hubo manera de iniciar el servicio.
<br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/ftp_error.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/ftp_error2.png)

<br>
También se ha intentado instalar una versión antigua de sudo para la vulnerabilidad de la máquina <a href="https://www.s2grupo.es/vulnerabilidad-de-sudo-cve-2023-22809/">CVE-2023-22809</a>. Para instalar esta versión de sudo intentamos usar este código:

<br>
<br>

> apt-get install sudo=1.8.0*

Al hacerlo nos saltó un aviso diciendo que esa versión de sudo no está disponible.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/problema-sudo1.png)

Así que optamos por descargarnos el código fuente y luego instalarlo. Así que para ello tuvimos que seguir estos comandos para la instalación:

>apt-get install libpam0g-dev <br>
>apt-get install build-essential <br>
>tar -zxvf sudo-1.8.0.tar.gz <br>
>cd sudo-1.8.0 <br>
>./configure <br>
>make <br>
>make install <br>

Una vez instalado esa versión de sudo, intentamos aplicar la vulnerabilidad sin éxito alguno. Así que decidimos comprobar que versión estaba instalada y al comprobarlo vimos la versión correcta. Pero tras realizar varias pruebas no se pudo explotar esta vulnerabilidad con exito.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/problema-sudo2.png)

<h1 name="Actualizaciones">8. Actualizaciones</h1>

Hemos aplicado la CVE 2023-32784, la cual se aprovecha del programa gestor de contraseñas **KeePass**, para poder descubrir la contraseña maestra y asi poder ver las contraseñas almacenadas en el archivo.
<br>

https://www.incibe.es/incibe-cert/alerta-temprana/vulnerabilidades/cve-2023-32784

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/password_keepass.png) <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/jose.png) <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/volcado.png) <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/user-jose.png) <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/sudoers.png) <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/home-pepe.png) <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/dockerc.png) <br>


