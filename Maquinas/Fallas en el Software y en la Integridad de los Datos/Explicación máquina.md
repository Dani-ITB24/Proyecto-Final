# **Máquina: Fallas en el Software y en la Integridad de los Datos**

## Objetivo
Esta máquina está específicamente diseñada para explotar la vulnerabilidad ***A08:2021 – Fallas en el Software y en la Integridad de los Datos*** y otras vulnerabilidades.

## Planteamiento
Para cumplir con este objetivo, la máquina alojará varios servicios como **MariaDB** y **Apache** que alojarán el gestor de contenido de **Wordpress**.
Estos servicios se encontrarán expuestos externamente para que cuando el atacante realice un reconocimiento pueda detectarlos.

El servicio de **MariaDB** tendrá la función de almacenar los usuarios e información necesaria de Wordpress en la BBDD.

El servicio de **apache** alojará el gestor de contenido de **Wordpress** que es una plataforma para diseñar paginas web online de forma sencilla.

El gestor de contenido de **Wordpress** tendrá la versión **5.5.14** y dispondrá del plugin [**mail-masta 1.0**](https://www.exploit-db.com/exploits/50226), este plugin es vulnerable a **Local File Inclusion** a través de un parametro en la URL.

****

Para comenzar el atacante realizará un reconocimiento de los servicios expuestos por la maquina, y de primeras solo podrá ver los servicios de **apache** y **mariaDB**.

Cuando el atacante se ponga a revisar la web verá que se trata de una web hecha con **Wordpress**, el atacante se pondra realizar FUZZING para descubrir subdirectorios ocultos, pero no encontrará nada.

Para encontrar la vulnerabilidad el atacante deberá utilizar la herramienta de **wpscan** para saber más información acerca de que plugins y configuraciones tiene Wordpress, de esta forma encontrará que existe un plugin con nombre de **mail-masta 1.0**.

Cuando se ponga a buscar vulnerabilidades sobre este plugin verá que puede realizar un LFI, el cual deberá usar para apuntar al fichero de wp-config.php del propio Wordpress, esto se tendrá que realizar utilizando el wrapper de base64 encode, para que la pagina web no interprete el codigo PHP y solo lo muestre por pantalla en base64.

Este texto en base64 será el contenido de wp-config.php y aqui se verá almacenado el usuario y contraseña del usuario **alfredo** que es administrador en **Wordpress**.

Una vez se tenga acceso como administrador en wordpress el atacante podrá modificar cualquier archivo **.php** para poder introducir codigo en **PHP** y ejecutarse una reverse shell.

Cuando el atacante tenga acceso a la maquina como **www-data**, deberá ver que usuarios existen dentro del sistema y encontrara al usuario **daniel**.

Para cambiar a este usuario **daniel**, el atacante tendrá que utilizar la contraseña que aparece en wp-config.php ya que esta será una contraseña reutilizada con este usuario, de esta forma el atacante podrá cambiar de usuario a **daniel**.

Una vez el atacante tenga acceso como **daniel**, para escalar de privilegios tendra que abusar de una capabilitie de **vim**.


Una vez tenga acceso con el usuario root, el atacante podrá visualizar el flag de root.txt dentro de /root/, además de obtener acceso completo a toda la maquina.

## Configuración del entorno
Para configurar el entorno utilizaremos un contenedor Docker con el sistema operativo Ubuntu Server. Los servicios que utilizaremos son:

- **HTTP**: *Apache 2.4.52* --> Para el servidor web.
- **MariaDB**: *MariaDB 10.6.16* --> Para las bases de datos
 
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
