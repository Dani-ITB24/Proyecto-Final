# **Máquina: Fallas en el Software y en la Integridad de los Datos**

## Objetivo
Esta máquina está específicamente diseñada para explotar la vulnerabilidad ***A08:2021 – Fallas en el Software y en la Integridad de los Datos*** y otras vulnerabilidades.

## Planteamiento
Para cumplir con este objetivo, la máquina alojará varios servicios como **FTP**, **MySQL** y **Apache** que alojarán la plataforma de **Wordpress**.
Estos servicios se encontrarán expuestos externamente para que cuando el atacante realice un reconocimiento pueda detectarlos.

El servicio **FTP** podrá ser accesible de forma anónima pero no vera ni podra hacer nada, sera para despistar.

El servicio de **SSH** no tendrá ninguna función más que despistar al atacante.

El servicio de **MariaDB** tendrá la función de almacenar usuarios en la BBDD.

El servicio de apache alojará la plataforma de **Wordpress** que es una plataforma para montar paginas web online. 
Esta plataforma de **Wordpress** dispondrá de plugins como  **mail-masta 1.0**, la cual es vulnerable a **Fallas en el Software y en la Integridad de los Datos**. 

Esta vulnerabilidad consiste en abusar del método file inclusion y SQL Injection

A través de esta vulnerabilidad se puede encontrar un fichero con codigo base64 que el atacante puede descodificar y ver usuario y contraseña de wordpress, una vez dentro de wordpress el atacante tendra que modificar una de las paginas para hacer una reverse shell en php a su propio equipo obteniendo acceso al sistema como www-data.

www-data podra ver el fichero /etc/passwd, y saber que usuario existen en el sistema. En el sistema hay un usuario llamado daniel, que tendra la contraseña de admin que se encuentra en wp-config.php.

Este usuario tendrá un permiso de SUID en chmod que tenga como propietario a root, de esta forma el usuario podrá abusar de este permiso SUID y escalar privilegios al usuario root,
comprometiendo totalmente la máquina y disponiendo de permisos y acceso total.

Obteniendo el acceso a root podremos visualizar la flag de root.txt dentro de /root/.

## Configuración del entorno
Para configurar el entorno utilizaremos un contenedor Docker con el sistema operativo Ubuntu Server. Los servicios que utilizaremos son:

- **FTP**: *vsftpd* version 3.0.3 --> Para transferencia de archivos.
- **HTTP**: *Apache 2.4.58* --> Para el servidor web.
- **MySQL**: *MySQL 2.1.0* --> Para las bases de datos
 
## Pasos a seguir

1. **Instalación de Docker**
2. **Creación del Dockerfile**
3. **Verificación de contenedor Docker**
4. **Primeras pruebas de Docker**
5. **Configuración de la máquina y paquetes**
6. **Testeo de vulnerabilidades**
7. **Aplicar mejoras y corregir errores/problemas**
8. **Volver a testear las vulnerabilidades**
9. **Redactar el reporte y documentación final**
