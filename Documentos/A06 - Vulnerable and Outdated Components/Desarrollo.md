# **Índice**

<span style="color:black;">1. [ Introducción](#introducción)</span><br>
<span style="color:black;">2. [ Desarrollo del contenedor](#Desarrollo)</span><br>
<span style="color:black;">3. [ Desarrollo de las webs](#Desarrollo2)</span><br>
<span style="color:black;">4. [ Problemas encontrados en el desarrollo](#Problemas)</span><br>
<span style="color:black;">5. [ CTF](#CTF)</span><br>
---

<br>

<h1 name="introducción">1. Introducción</h1>
Para desarrollar el contenedor Docker, se ha tenido en cuenta que debe ser vulnerable al ataque A06:2021 - Componentes vulnerables y desactualizados. Para que nuestro contenedor sea vulnerable frente al anterior ataque, hemos optado por no utilizar la última versión de Ubuntu, así que montaremos el contenedor con un Ubuntu 20.04 como base.


<h1 name="Desarrollo">2. Desarrollo del contenedor</h1>
El contenedor Docker estará basado en Ubuntu 20.04 Server y tendrá instalados los siguientes programas:
<ul>
  <li>Wireshark, el cual nos permitirá realizar una captura de red mientras se ejecuta el ataque. Esta captura será analizada posteriormente.</li> 
  <li>Apache, nos permitirá tener un servidor web alojado en Docker.</li> 
  <li>VSFTPD, servidor FTP para acceder a recursos y archivos del sistema.</li> 
  <li>X11, esta utilidad nos permite utilizar Wireshark de forma gráfica desde el contenedor Docker.</li> 
  <li>VIM/NANO, editores de texto.</li> 
</ul>


<h1 name="Desarrollo2">3. Desarrollo</h1>


<h1 name="Problemas">4. Problemas encontrados en el desarrollo</h1>


<h1 name="CTF">5. CTF</h1>

