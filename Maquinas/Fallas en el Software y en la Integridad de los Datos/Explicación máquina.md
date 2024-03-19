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

Cuando el atacante acceda como **daniel** encontrá la flag **user.txt** dentro del **home de daniel**. Ya encontrada la flag el atacante, tendrá que buscar una manera de escalar privilegios con el usuario **daniel**, después de estar buscando el atacante encontrará que puede ejecutar con permiso **SUID** el comando **vim**.

El atacante después de saber esto intentará alguna manera de con vim poder acceder con un bash para esto se va a **gtfobins** a ver si se puede ejecutar una **shell** con **vim**, encuentra el siguiente comando "**vim -c ':python3 import os; os.execl("/bin/bash", "bash", "-pc", "reset; exec bash -p")'**" para ejecutar una **shell** como **root**. 

Una vez que el atacante tenga acceso al usuario **root**, el atacante podrá ver la flag de **root.txt** dentro de **/root/**, además de obtener acceso completo a toda la máquina.

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

## WriteUp (vista atacante)

Hacemos un escaneo de puertos para ver que servicios tiene disponible la maquina.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/8f36cd3e-b4ab-4cb4-8c4f-e15194e96890)

Al solo tener sevicio web(apache2) vemos que poniendo la ip en el navegador vemos la pagina de apache2 default.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/4133e7dc-6894-42c4-9b3c-dfa47f988e18)

Hacemos un gobuster para ver si tiene alguna carpeta oculta.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/66732b63-2ff2-487c-aee5-982737548181)

Vemos que tiene wordpress con una pagina inicial.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/6c72daf0-b0a8-4e5b-836e-3645bcbfa1bb)

Hacemos un wpscan para ver que version tiene este wordpress y que plugins tiene instalados, y si son vulnerables.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/eba8bd19-fe4f-4e03-a110-988c879dd6aa)

Vemos que tiene el plugin mail-masta vulnerable a local file inclusion.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/e56a815f-6fc2-4c7d-bab1-28ccd11aa6ff)

Buscamos por internet la vulnerabilidad que tiene este plugin, y vemos que podemos visualizar archivos de el servidor haciendo local file inclusion, por ejemplo /etc/passwd que vemos un usuario de sistema llamado daniel.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/c1616007-30da-4e81-841d-b78726841515)

Nos apuntamos este nombre en un archivo de texto externo para tener en cuenta este usuario. 

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/ef5a750e-3dcc-47a2-894a-2ec1c365cd65)

Investigando vemso un archivo que puede contener credenciales para entrar al servidor o al propio wordpress. Pero no nos deja visualizarlo en texto plano.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/81d5151a-93e2-4daf-96b3-982e8b337888)

Buscando para poder visualizar este archivo, podemos enodearlo en base64.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/a2d507f2-691d-4ce1-9113-aef9fa8ad0f5)

Copiamos este codigo en base64 y lo pegamos en un archvio creado en nuestra maquina atacante llamado desencode.php.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/8f0535b3-b584-49ef-b1c0-e7252ea8f4a7)

Lo descodificamos con un cat.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/9182ceb9-93ee-4d56-90cf-0ac6d3abcee5)

Ya podemos ver bien este archivo, y he descubierto dos usuarios y dos contraseñas diferentes.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/f1caafb9-fa6a-4bd5-8e34-b81ae9fe88d5)

Las apuntamos en el fichero txt para guardar culquier pista.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/78056615-92a7-47da-bb27-d475ba76b27b)

Buscamos hacer login en wordpress, que es poniendo en nuestro navegador detras de wordpress /wp-login.php.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/baf2fde5-adfe-4f8e-82e9-4be191ebca2c)

Probamos con admin y su contraseña pero no funciona. Ahora prbamos con alfredo y parece que es correcta.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/a744c4b0-0d43-4f4e-804e-45a716664035)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/3984d646-0a74-49fe-bb23-07d1ced3c998)

Tenemos control total del wordpress, una vez aqui dentro podemos ver plugins, cambiar paginas, y lo que utilizaremos sera el editor de temas para poder hacer una reverse shell.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/24488e10-9fb2-4116-b577-d68a72fb7593)

Elegimos una pagina facil de encontrar por ejemplo el footer.php que podemos editar el codigo fuente de esta pagina desde aqui.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/105ba433-06d3-4630-97dc-33c8034104ef)

Borramos el codigo que viene por defecto y lo cambiamos por una reverse shell en php. Cambiamos la ip por la nuestra y el puerto que queramos.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/4e312f9f-6e7e-461f-bc38-787af6f8d763)

Actualizamos el archivo, para que quede guardado.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/4046fb39-4bff-4f73-8ede-4ad0f78cc4af)

Nos ponemos en escucha en nustra maquina para recibir la respuesta de esta reverse shell, con el puerto especificado en este.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/0c042ca6-dbdf-4ad5-b0f5-f63ec0cff7e6)

En nuestro navegador buscamos esta pagina editad, para ejecutar el codigo cambiado de esta. Al haber editado el footer.php la pagina no se quedara cargando pero nos llegara la respuesta igual.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/2c613480-20f2-4b5d-a7aa-e00a0fecb5a4)

Investigando el usuario www-data no tiene acceso a nada ni hay ninguna pista, lo unico que sabemos e sque hay un usuario llamado daniel. visto anteriormente en /etc/passwd.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/e28ceda4-4d86-4033-b3bc-d3197162a9d1)

Lo unico que nos queda es probnar las contraseñas acumuladas anteriormente, si con suerte una de estas es la de daniel.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/c3f1de7d-ed6e-402d-ab90-3f24d8e16d08)

Ponemos la contraseña de admin y parece que este usuario tiene la misma contraseña, a si que estamos dentro de daniel.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/8ddd77cb-261f-488d-be93-ff531056566b)




