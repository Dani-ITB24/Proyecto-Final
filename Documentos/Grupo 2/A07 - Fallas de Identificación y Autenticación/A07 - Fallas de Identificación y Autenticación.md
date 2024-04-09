# Grupo 4: Fallas en el Software y en la Integridad de los Datos

## **Índice**

<span style="color:black;">1. [ Enumeración](#Enumeración)</span><br>
<span style="color:black;">2. [ Buscar vulnerabilidades](#Vulnerabilidades)</span><br>
<span style="color:black;">3. [ Flag user.txt](#Flag1)</span><br>
<span style="color:black;">4. [ Escalada de privilegios a Root y flag de root](#root)</span><br>
<span style="color:black;">5. [ Valoración](#valoracion)</span><br>

---

<br>

<h1 name="Enumeración">1. Enumeración</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/nmap.png" alt="nmap">

> nmap -p- -sVC 172.17.0.2 

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/gobuster.png" alt="gobuster">

> gobuster dir -u http://172.17.0.2/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt

<br>
<h1 name="Vulnerabilidades">2. Buscar vulnerabilidades</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/web1.png" alt="Web principal">

Si accedemos a la IP de la máquina con un navegador web nos encontramos con una página web fuera de servicio. Si inspeccionamos tampoco se encuentra nada comentado. Vamos a acceder al directorio /accountlogin que hemos encontrado anteriormente.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/web2.png" alt="Web secundaria /accountlogin">

En esta nueva página encontramos dos botones que nos redirigen a un inicio de sesión de adminstradores y de usuarios "normales", cada uno por separado. Siendo http://172.17.0.2/accountlogin/admin/page-login.php y http://172.17.0.2/accountlogin/user/page-login.php los enlaces respectivamente.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/gobuster2.png" alt="gobuster2">

Investigando más acerca de los posibles directorios dentro de estos dos enlaces, me encontré con varias carpetas de configuración, imágenes e iconos. Siendo sincero no encontré nada extraño, toda la configuración parecía estar bien aplicada porque no me dejaba acceder a según que recursos, contando con redirección a la página de inicio de sesión principal.

Analizando toda esta información lo primero que pensé fue: esta web no ha sido hecha a mano, han tenido que contar con una instalación ya configurada. Así que decidí buscar por Internet a ver que encontraba.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/video.png" alt="video">

Después de estar horas buscando en decenas de webs y no encontrar nada, me topé con este vídeo de YouTube, el cual es un tutorial de exactamente el mismo proyecto de "Travel management".

En la descripción del mismo vídeo podemos encontrar una página web para descargar el proyecto: [Web de descarga del proyecto](https://www.mayurik.com/source-code/P5963/online-tours-and-travels-management-system-project-in-php-and-mysql). Vamos a intentar acceder con las credenciales por defecto.

Credenciales: mayuri.infospace@gmail.com / admin

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/admin.png" alt="Panel de administración">

Ahora tenemos acceso al panel de administración. Vamos a intentar descubrir si podemos subir una reverse shell o por donde podemos continuar.

Después de investigar durante un buen rato descubrimos varias cosas:

1. No se puede subir absolutamente ningún archivo.
2. Solo se puede añadir información sobre la gestión de impuestos, gestión de equipaje y los viajeros (toda esta información se añade en una base de datos en local).
3. Se puede interceptar la petición al añadir información sobre la gestión de los gastos (expense managament) con burpsuite.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/vulnerabilities.png" alt="Búsqueda de vulnerabilidades del proyecto Travel Manager">

Podemos encontrar varios CVE sobre SQL y ejecución de código en remoto en diferentes versiones de Travel Manager. Por el momento vamos a intentar interceptar una petición con burpsuite.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/burpsuite1.png" alt="Interceptar petición con burpsuite">

Nos desplazaremos hasta el desplegable "**Expense Managament**" > "**Add Expense**" y añadiremos un nuevo gasto. Antes habremos  configurado la extensión de foxyproxy por el puerto 8080 (por ejemplo), y tendremos el Proxy Intercept de Burpsuite activo para interceptar la petición. 

Al dar a "**Save**" conseguiremos capturar la petición. En burpsuite haremos clic derecho > Copy to file y lo guardaremos en el directorio que consideremos.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202//A07%20-%20Fallas%20de%20Identificación%20y%20Autenticación/Assets/sql1.png" alt="sql file">


<br>
<h1 name="Flag1">3. Flag user.txt</h1>



<br>
<h1 name="root">4. Escalada de privilegios a Root y flag de root</h1>



<br>
<h1 name="valoracion">5. Valoración</h1>



<br>