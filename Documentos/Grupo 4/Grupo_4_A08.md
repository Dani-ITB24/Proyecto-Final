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

<br>
<h1 name="Flag1">3. Flag user.txt</h1>



<br>
<h1 name="Movimiento">4. Movimiento lateral</h1>


<br>
<h1 name="Escalada">5. Escalada de privilegios a Root</h1>


<br>
<h1 name="flag-root">6. Flag de Roo</h1>
