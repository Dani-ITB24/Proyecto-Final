Escanemos los puertos de la maquina para ver que servicios estan activados.
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_8.png" />
</p>


Usamos gobuster de la pagina web 
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_11.png" />
</p>


Esta abierto el puerto 5000 que tiene otra web.
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_10.png" />
</p>

Entramos en la pagina  l,p,k tiene este archivo de texto

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_13.png" />
</p>


Entramos en la pagina web de admin

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_12.png" />
</p>

Entramos en la pagina web de url validor modificaremos la petición realizada a la web que valida URL para que en vez de validar Google realice una petición a localhost.

  172.17.0.2/info.php?url=http%3A%2F%2Flocalhost%3A5000
  
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_17.png" />
</p>

Entramos herramientas de desarollador y nos saldra un usuario del sistema

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_18.png" />
</p>

Usamos hydra con el usuario que sabemos del sistema

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_19.png" />
</p>

Hacemos un ls y vemos que hemos encontrado la flag de user

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_29.png" />
</p>


Buscamos la clave ssh de francisca para cambiar de usuario 

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_20.png" />
</p>

Dentro de esta clave SSH para conectarnos a ssh miramos los permisos del fichero

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_21.png" />
</p>

Miramos el archivo id_rsa es el archivo de ssh de francisca

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_22.png" />
</p>

Hacemos un ssh al usuario francisca 

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_24.png" />
</p>

Buscamos archvios del grupo dbadmin para escalar privilegios a root

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_25.png" />
</p>

Creamos un archivo head y ejecutamos backupdb esto nos permite entrar como root

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_27.png" />
</p>

Buscamos la flag de root y lo mostramos

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_28.png" />
</p