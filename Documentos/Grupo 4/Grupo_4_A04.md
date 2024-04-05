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


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A04/tries.png" alt="Intentos de enumeración de usuarios">


<br>
<h1 name="Flag1">3. Flag user.txt</h1>




<br>
<h1 name="root">4. Escalada de privilegios a Root y flag de root</h1>



<h1 name="valoracion">5. Valoración</h1>

