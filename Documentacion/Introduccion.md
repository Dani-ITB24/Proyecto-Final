# índice

1. [Introducción](#introducción)
2. [Informacion Sobre los Riesgos Obtenidos](#informacion-sobre-los-riesgos-obtenidos)
    - [Inyeccion](#inyeccion)
    - [Fallas de Identificación y Autenticacion](#fallas-de-identificacion-y-autenticación)
3. [Información Sobre los Componentes Fundamentales](#información-sobre-los-componentes-fundamentales)
    - [MariaDB](#mariadb)
    - [Docker](#docker)
    - [Apache](#apache)
    - [PHP](#php)
8. [Desarrollo Contenedor Numero 1 - Inyección](#contenedor-numero-1-inyección)
    - [Vulnerabilidades CVE Extra](#vulnerabilidades-cve-extra)
    - [Desarrollo de las Vulnerabilidades](#desarrollo-de-la-vulnerabilidad)
    - [Análisis del Contenedor una vez Explotado](#análisis-del-contenedor-una-vez-explotado)
    - [Herramientas Empleadas](#herramientas-empleadas)

9. [Desarrollo Contenedor Numero 2 Fallas de Identificación y Autenticación](#contenedor-numero-2-fallas-de-identificación-y-autenticación)
    - [Vulnerabilidades CVE Extra](#vulnerabilidades-cve-extra)
    - [Desarrollo de las Vulnerabilidades](#desarrollo-de-la-vulnerabilidad)
    - [_Walkthrough_ Explotación del Contenedor] (#desarrollo-de-la-vulnerabilidad)
    - [Análisis del Contenedor una vez Explotado](#análisis-del-contenedor-una-vez-explotado)    

# [Introducción](#índice)

El propósito principal de este documento es mostrar la creación de dos contenedor en Docker con los siguientes riesgos del OWASP TOP 10:

- **A03:2021 - Inyección**
- **A07:2021 - Fallas de Identificación y Autenticación**

Cada uno de los 2 contenedores tendrá únicamente 1 riesgo de los mencionados. Por otro lado, se implementarán vulnerabilidades descubiertas de 2023 en adelante.

A continuación se explicarán en profundidad los riesgos mencionados, desde la descripción hasta la mitigación.

# [Informacion Sobre los Riesgos Obtenidos](#índice)

## [Inyeccion](#índice)

Es un riesgo de inserción de código malicioso en una entrada de datos para obtener acceso no autorizado o realizar acciones no deseadas.
<p align="center">
<img  alt="drawing" width=600" height="200" src="https://www.indusface.com/wp-content/uploads/2019/08/OWASP-Part1-4.png" />
</p>

**Ataques de Inyección**

- **SQL Injection:** Se insertan comandos SQL maliciosos en las entradas de datos de una aplicación web. 

- **XSS:** Este tipo de ataque implica la inserción de scripts maliciosos en páginas web accesibles por otros usuarios.

- **Command Injection:** Los atacantes insertan comandos del sistema operativo en entradas de datos de aplicaciones para ejecutar comandos arbitrarios en el servidor. 

- **LDAP:** Los atacantes pueden manipular consultas LDAP para obtener acceso no autorizado a la información para realizar acciones no deseadas en el sistema.

- **XPath Injection:** Se dirige a sistemas que utilizan expresiones XPath para realizar consultas en documentos XML.

**Impacto**

Las inyecciones pueden dar lugar a la obtención y distribución no autorizada de información sensible, alteración de datos, ejecución remota de comandos, o incluso la toma de control completo del sistema. Estos riesgos pueden tener repercusiones significativas en la integridad, confidencialidad y disponibilidad de los sistemas y datos afectados.

**Mitigación**

Para prevenir los ataques de inyección podemos emplear las siguientes medidas:

- **Validación de Entradas de Usuario:** Validar y filtrar todas las entradas de usuario.

- **Parámetros Preparados:** Utilizar consultas parametrizadas.

- **Escapado de Caracteres:** Escapar los caracteres especiales antes de incluirlos en consultas SQL.

- **Validación de Datos de Formulario:** Validar y filtrar los datos del formulario. 

- **Privilegios Mínimos:** Limitar los permisos de los usuario y servicios para que tengan los privilegios mínimos necesarios para realizar sus funciones.

- **Actualizaciones y Parches:** Mantener actualizados todo el software.

- **Seguridad en la Capa de Red:** Utilizar firewalls y sistemas de detección de intrusiones para monitorear y filtrar el tráfico malicioso.

- **Educación:** Educar a las perosnas sobre las mejores prácticas de seguridad.

# [Fallas de Identificacion y Autenticación](#índice)

Las fallas de identificación y autenticación es un riesgo relacionado con la gestión de credenciales de usuario y los procesos de verificación de identidad en sistemas informáticos. Este riesgo permite a los atacantes acceder de forma no autorizada a datos sensibles.
<p align="center">
<img  alt="drawing" width="250" height="200" src="https://www.grupocibernos.com/hubfs/blog-error%20de%20autenticaci%C3%B3n.jpg" />
</p>

**Causas comunes de fallas de identificación y autenticación**

- **Contraseñas Débiles:** Las contraseñas deben cumplir unos requisitos mínimos para estar clasificadas como "no débiles".

- **Falta de Autenticación Multifactor (MFA):** La autenticación multifactor agrega una capa adicional de seguridad.

- **Reutilización de Contraseñas:** Si los usuarios utilizan la misma contraseña para múltiples servicios, el compromiso de una sola cuenta puede poner en riesgo todas las demás cuentas asociadas con esa contraseña.

- **Falta de Protección contra Ataques de Fuerza Bruta:** Los atancates que usan fuerza bruta intentaran adivinar las contraseñas probando una gran cantidad de combinaciones posibles. 

- **Falta de Monitoreo y Detección de Anomalías:** Permite que los atacantes accedan a los sistemas sin ser detectados.

- **Falta de Educación del los Usuarios:** No informar a los usuarios de las mejores prácticas de seguridad.

**Impacto**

Este riesgo puede derivar en acceso no autorizado, suplantación de identidad, exposición de credenciales y violación de privacidad. Las consecuencias incluyen la posibilidad de pérdida de datos, violación de la privacidad, y riesgos de cumplimiento normativo.

**Mitigacion**

- **Contraseñas Seguras:** Establecer requisitos mínimos de complejidad de contraseña (longitud, caracteres especiales, combinación de letras mayúsculas y minúsculas) 

- **Autenticación Multifactor:** Implementar la autenticación multifactor para agregar una capa adicional de seguridad.
  
- **Gestión de Sesiones:** Implementar mecanismos para gestionar adecuadamente el tiempo de conexion de los usuarios.
  
- **Protección contra Ataques de Fuerza Bruta:** Bloquear una cuenta después de varios intentos de inicio de sesión fallidos.

- **Monitoreo de Actividad de Usuario:** Implementar sistemas de monitoreo para detectar y responder a actividades de usuarios anómalas o maliciosas.

- **Educación del Usuario:** Educar a los usuarios sobre prácticas seguras de autenticación.

- **Actualizaciones y Parches:** Mantener actualizados los sistemas y aplicaciones.

# [Información Sobre los Componentes Fundamentales](#índice)

## [MariaDB](#índice)

 **¿Qué es Mariadb?**
 
MariaDB es un sistema de gestión de bases de datos de código abierto que ofrece poder almacenar y manipular datos de manera eficiente.

 <p align="center">
<img  alt="drawing" width="320" height="200" src="https://www.wpsysadmin.com/wp-content/uploads/2021/07/mariadb.png" />
</p>

 **Ventajas y desventajas de MariaDB**

**Ventajas:**

- **Compatibilidad con MySQL:** Es compatible con la mayoría de las aplicaciones y herramientas diseñadas para MySQL. 

- **Código abierto:** Es un proyecto de código abierto.

- **Comunidad activa:** Cuenta con una comunidad de usuarios.

- **Compatibilidad con estándares:** MariaDB cumple los  estándares SQL.

 **Desventajas:**
 
- **Complejidad de Migración:** Si estás migrando desde otro sistema de gestión de bases de datos (DBMS), la complejidad de la migración puede ser bastante complicada.

- **Menor Frecuencia de Actualizaciones:** MariaDB se suele actualizar menos en comparación con otros sistemas de bases de datos. Esto implica que no tenga las últimas características y mejoras de seguridad.

 **Instalacion y Configuración** 

Para instalar y poner contraseña a root ejecutamos los siguientes comandos:

```
apt install mariadb-server
service mariadb start
mariadb
```

Una vez dentro:

```
USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'contraseña';
flush privileges;
exit;
```
        
Una manera alternativa de configurar esto es ejecutando el siguiente comando:

```
sudo mysql_secure_installation
```

## [Docker](#índice)

 **¿Qué es Docker?**

Docker es una plataforma de código abierto diseñada para facilitar la creación, implementación y ejecución de aplicaciones dentro de contenedores. Los contenedores son entornos de software ligeros y portátiles que encapsulan todo lo necesario para que una aplicación se ejecute, incluidas las bibliotecas, dependencias y otros componentes, lo que les permite funcionar de manera consistente en cualquier entorno.
<p align="center">
<img  alt="drawing" width="320" height="200" src="https://d1.awsstatic.com/acs/characters/Logos/Docker-Logo_Horizontel_279x131.b8a5c41e56b77706656d61080f6a0217a3ba356d.png" />
</p>

 **Ventajas y desventajas de Docker**

 **Ventajas:**

- **Portabilidad:** Los contenedores Docker proporcionan una forma fácil y rápida de empaquetar una aplicación y todas sus dependencias en un entorno aislado.

- **Ligereza:** Los contenedores Docker son ligeros y rápidos de crear, iniciar y detener.

- **Aislamiento:** Docker proporciona un alto nivel de aislamiento entre contenedores cada contenedor tiene su propio sistema de archivos.


**Desventajas:** 

- **Comunidad Fragmentada:** Diferentes tipos opiniones dentro de la comunidad de usuarios, dificultad en la colaboración dentro de la comunidad.

- **Rendimiento:** El rendimiento de la virtualización a nivel de contenedor en menor que las aplicaciones fuera del contenedor.


 **Instalacion de Docker**
Para instalar debemos seguir los siguientes pasos:

**1. Añadir clave GPC de docker:**

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

**2. Añadir repositorio oficial de docker:**

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable
```
    
**3. Instalacion docker:**

```
sudo apt install docker-ce docker-ce-cli containerd.io
```

## [Apache](#índice)

Apache es un servidor web de código abierto.

<p align="center">
<img  alt="drawing" width="250" height="200" src="https://www.ibxagency.com/blog/wp-content/uploads/2014/06/apache_server2.jpg" />
</p>

 **Ventajas y desventajas de Apache:**
 
 
**Ventajas:**

- **Código Abierto:** Es un software de código abierto.


- **Soporte para múltiples plataformas:** Apache es compatible con una amplia gama de sistemas operativos.

- **Comunidad activa::** Apache cuenta con una gran comunidad de usuarios. 

**Desventajas:**


- **Consumo de recursos:** Requiere más recursos que otros servidores web.
  

 **Instalacion de Apache:**

Para instalar apache tienes que poner este comando:

```
sudo apt install apache2
```

## [PHP](#índice)

PHP es un lenguaje de programación de código abierto interpretado del lado del servidor.

<p align="center">
<img  alt="drawing" width="250" height="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/1200px-PHP-logo.svg.png" />
</p>


 **Ventajas y desventajas de PHP:**
 
**Ventajas:**


- **Integración con HTML:** PHP se puede integrar fácilmente con HTML

- **Soporte para Bases de Datos:** PHP tiene un soporte para la gestión de bases de datos.

- **Comunidad activa::** PHP cuenta con una gran comunidad de usuarios. 

**Desventajas:**


- **Rendimiento:** En comparación con otros lenguajes de programación PHP puede tener un rendimiento relativamente inferior depende de la circunstancia.



 **Instalacion de PHP:**

Para instalar PHP tienes que poner este comando:

```
sudo apt install libapache2-mod-php
```

# [Contenedor Numero 1 Inyección](#índice)

El sistema operativo utilizado para el desarrollo de este primer contenedor es Ubuntu Server XX. La vulnerabilidad elegida ha sido SQL Injection. Es por ello que el desarrollo de esta estará basado en un formulario cuyos campos serán vulnerables a este tipo de ataque. 

<p align="center">
<img  alt="drawing" width="350" height="200" src="https://blogs.zeiss.com/digital-innovation/de/wp-content/uploads/sites/2/2020/05/201909_Security_SQL-Injection_1.png" />
</p>


## [Vulnerabilidades CVE Extra](#índice)

Para realizar la búsqueda de las CVEs añadidas como extra en la máquina, hay que tener en cuenta los siguientes puntos:
- **La CVE debe ser del año 2023 o posterior**
- **La CVE debe ser reproducible**
- **La CVE debe tener un exploit desarrollado**

CVE Extra elegida para su reproducción:

- **CVE-2023-37629**

Esta vulnerablidad permite al usuario subir archivos maliciosos con el fin de obtener acceso al servidor, por ejemplo un script en php que ejecute una reverse shell.

**Mitigación**

Para mitigar esta vulnerabilidad lo único que debemos hacer es sanitizar la subida de archivos, permitiendo únicamente la subida de imágenes y nada más.

- **CVE-2023-32784**

Esta vulnerablidad permite al usuario dumpear la clave maestra de KeePass en texto claro, permitiendo así un posible escalado de privilegios.

**Mitigación**

Para mitigar esta vulnerabilidad lo único que debemos hacer es actualizar la versión.

## [Desarrollo de las Vulnerabilidades](#índice)

1.Atacante hace fuzzing y encuentra el panel de inicio de cerdos.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/gobuster.png" />
</p>

2.Entra en la pagina login y usa la herramienta burpsuite para hacer un ataque de fuerza bruta.
<p align="center">
<img  alt="drawing"src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/intruder1.png" />
</p>
<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/intruder2.png" />
</p>

3.Despues de saltar el login el atacante sube un archivo php en la pagina web.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/addPig1.png" />
</p>

4.Luego el atacante tiene que ir updatefolder donde esta su archvio php y lo ejecuta para hacer una Reverse Shell.

<p align="center">
<img  alt="drawing" width="550" height="400" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/uploadfolder.png" />
</p>

5.Nos ponemos con el netcat escuchando en el puerto 4444 para entrar al sistema.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/www-data.png" />
</p>

6.Hemos entrado al sistema con el usuario www-data miramos lo que hay con el comando ls , hacemos otro ls para ver lo que hay dentro de la carpeta compartidos por ultimo hacemos un cat para ver lo que hay en datos.txt .

<p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/way2.png" />
</p>

7.Vamos a la pagina banco de credenciales.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/bancoCredencialesPrivado.png" />
</p>

8.Hacemos un ataque sql injection a la pagina banco de credenciales.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/loginBancoSQLi.png" />
</p>

9.Nos saldra los nombres de usuarios con sus contraseñas incriptadas en base64.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/finalCredentials.png" />
</p>

10.Vamos a desencriptar las contraseñas encriptadas en base 64.

<p align="center">
<img  alt="drawing" width="550" height="400" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/base64Decode.png" />
</p>

11.Entramos en el usuario Pastorpaco , hacemos ls para ver lo que hay dentro del usuario dentro hay un zip incriptado y una flag. Abrimos la flag del usuario.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/flagUser.png" />
</p>

12.Usamos jhon the ripper para romper la contraseña de credencialesseguras.zip

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/john.png" />
</p>

13.Cuando rompamos la contraseña abrimos el zip y vemos lo que hay dentro.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/granjero.txt.png" />
</p>


14.Miramos que grupos esta el usuario granjero
<p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/groups.png" />


15.Hacemos sudo su y entramos en el usuario root.
</p>

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/getRoot.png" />
</p>

16. Por ultimo buscamos la flag de root.

<p align="center">
<img  alt="drawing" width="550" height="400" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/flagRoot.png" />
</p>

## [Análisis del Contenedor una vez Explotado](#índice)
Para analizar la maquina explotada primero hemos mirado los logs que tenemos en la maquina docker.

Tenemos los siguientes logs en nuestro docker:

- Logs de inicio de sesion de la pagina farm.

<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/logs.png" />
</p>

- Logs de inicio de sesion de la pagina banco.
<p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/logsBanco.png" />
</p>

- Logs de apache para ver los post y los get.
  
- Logs de mariadb para ver las querris.

### [Herramientas Empleadas](#índice)



# [Contenedor Numero 2 Fallas de Identificación y Autenticación](#índice)

## Planteamiento y Componentes

El sistema operativo utilizado para el desarrollo de este primer contenedor es Ubuntu Server. La vulnerabilidad elegida ha sido Fallas de Identificación y Autenticación. 

<p align="center">
<img  alt="drawing"  src="https://owasp.org/Top10/es/assets/TOP_10_Icons_Final_Identification_and_Authentication_Failures.png" />
</p>

## Vulnerabilidades CVE Extra

Para realizar la búsqueda de las CVEs añadidas como extra en la máquina, hay que tener en cuenta los siguientes puntos:
- **La CVE debe ser del año 2023 o posterior**
- **La CVE debe ser reproducible**
- **La CVE debe tener un exploit desarrollado**

CVE Extra elegida para su reproducción:

- **CVE-2024-2168**

Esta permite al atacante hacer una inyección de SQL que es posible lanzar el ataque de forma remota.

**Mitigación**

Manténer el software actualizado , Monitorea y registrar la actividad del sistema.

<p align="center">
<img  alt="drawing"  src="https://kinsta.com/es/wp-content/uploads/sites/8/2020/11/supervision-rendimiento-aplicaciones.png" />
</p>


## Desarrollo de las Vulnerabilidades


## Análisis del Contenedor una vez Explotado
