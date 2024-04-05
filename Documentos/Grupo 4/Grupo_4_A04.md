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

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/nmap.png" alt="nmap">

> nmap -p- -sVC 172.17.0.2 

Encontramos un servidor FTP, SSH y un Apache por el puerto por defecto.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/gobuster.png" alt="gobuster">

> gobuster dir -u http://172.17.0.2/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt

Hemos encontrado 2 directorios ocultos tras el servidor web.

<br>
<h1 name="Vulnerabilidades">2. Buscar vulnerabilidades</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/web_principal.png" alt="Web principal">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/web_ftp.png" alt="Web FTP">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/web_documents.png" alt="Web Documents">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/ftp_anon.png" alt="FTP Anonymous">

Se puede acceder como usuario anónimo al servidor FTP. Intentando subir una reverse shell por FTP, nos da un error. Así que vamos a intentarlo por otro lado.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/searchsploit.png" alt="Searchsploit">

Buscando todas las versiones de los servicios instalados, encontramos que el servicio OpenSSH de la versión 7.2p2 tiene una vulnerabilidad frente a enumeración de usuarios.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/opensshenum.png" alt="OpenSSH Users Enumeration">

Ahora que sabemos que es vulnerable frente a enumeración de usuarios del sistema por SSH, podemos tomar dos caminos:

1. Utilizar un diccionario de usuarios.
2. Crear nuestro propio diccionario de usuarios.

Teniendo en cuenta lo anterior, ya que tenemos una página web con bastante información, vamos a proceder a crear un diccionario con la información que encontremos relevante.


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/header.png" alt="Menú de la web">

Vamos a analizar la página web que hemos encontrado en un principio. El título principal de la página nos indica que es una fan page de ["The Originals"](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjBj9HonauFAxURdaQEHd84DzUQFnoECCwQAQ&url=https%3A%2F%2Fes.wikipedia.org%2Fwiki%2FThe_Originals&usg=AOvVaw0EHJwCYHTZMM4HscPDiWkv&opi=89978449), una serie de drama de Estados Unidos, del año 2013.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/personajes.png" alt="Personajes de la serie The Originals">

Explorando más la página, encontramos un apartado dedicado exclusivamente a algunos personajes de la serie. Mirando por internet, encontramos que la serie cuenta con 41 personajes, pero en esta fan page únicamente han dedicado tiempo en estos 7. Seguramente estemos ante los personajes principales o los favoritos de los creadores de la fan page. Vamos a añadirlos en el diccionario.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/users.png" alt="Diccionario de usuarios">

Diccionario con los personajes de la serie, todo en minúsculas y con la primera en mayúscula.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/tries.png" alt="Intentos de enumeración de usuarios">

Probando diferentes scripts encontramos con fallos y errores, vamos a intentarlo de una forma más "automática".

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/msfconsole1.png" alt="msfconsole">

Vamos a abrir Metasploit Msfconsole, pero antes hemos de seguir los siguientes pasos:

1. service postgresql start
2. msfdb init
3. msfconsole

Una vez se ejecute msfconsole y estemos podemos buscar lo que queramos utilizando **search**. Cuando busquemos lo que necesitemos, nos mostrarán los resultados, ponemos use y el número del auxilar que queramos utilizar. 

[SSH Username Enumeration](https://www.rapid7.com/db/modules/auxiliary/scanner/ssh/ssh_enumusers/)

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/msfconsole2.png" alt="msfconsole">

Ahora ya estamos utilizando el auxilar para enumerar los usuarios por SSH. Hacemos **show options** para ver los requisitos del script. Añadimos como **rhosts** o **remote hosts** a la IP de la máquina víctima, en este caso **172.17.0.2**.

Seguidamente añadimos el usuario o el diccionario de usuarios haciendo **set user_file** y la ruta completa del diccionario. 

Cuando esté todo listo, hacemos **run** para ejecutar el ataque. Nos ha encontrado el usuario *elijah*.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/hydra.png" alt="hydra">

Una vez sabemos que hay el usuario **elijah**, vamos a realizar un ataque de fuerza bruta frente al servicio SSH.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/connect.png" alt="Conectarse por SSH y FTP">

Si intentamos entrar por SSH con las credenciales nos devuelve un error, en cambio si que podemos conectarnos por FTP con las mismas credenciales.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/upload_reverse1.png" alt="Subir reverse.php por FTP">

Ahora ya tenemos permisos para leer y subir archivos, vamos a subir una [Reverse Shell](https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php) y a intentar acceder posteriormente.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/connect_reverse.png" alt="connect to reverse.php">

Si accedemos a la ruta http://172.17.0.2/documents/elijah/reverse.php habiendo puesto a escuchar por el puerto 4444 anteriormente, ejecutaremos la reverse shell y nos conectaremos a la máquina.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/access.png" alt="Connect as www-data">

Después de haber puesto nuestra máquina atacante a escuchar por el puerto 4444 y ejecutar la reverse shell **reverse.php**

<br>
<h1 name="Flag1">3. Flag user.txt</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/explore.png" alt="Explorando directorios">



<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/binwalk.png" alt="Binwalk">


<br>
<h1 name="root">4. Escalada de privilegios a Root y flag de root</h1>



<h1 name="valoracion">5. Valoración</h1>

