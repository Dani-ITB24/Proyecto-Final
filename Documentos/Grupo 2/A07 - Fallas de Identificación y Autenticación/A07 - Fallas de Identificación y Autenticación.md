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







<br>
<h1 name="Flag1">3. Flag user.txt</h1>



<br>
<h1 name="root">4. Escalada de privilegios a Root y flag de root</h1>



<br>
<h1 name="valoracion">5. Valoración</h1>



<br>