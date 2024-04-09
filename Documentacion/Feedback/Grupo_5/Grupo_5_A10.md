## Writeup

Escanemos los puertos de la maquina para ver qué puertos hay abiertos.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_8.png" />
</p>

Usamos gobuster para encontrar directorios ocultos en la página web

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_11.png" />
</p>

Está abierto el puerto 5000, que tiene otra web.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_10.png" />
</p>

Entramos en la pagina l,p,k tiene este archivo de texto

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_13.png" />
</p>

Entramos en la página web de admin

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_12.png" />
</p>

Entramos en la página web de url validor y modificamos la petición realizada a la web que valida URL para que en vez de validar Google realice una petición a localhost.

  172.17.0.2/info.php?url=http%3A%2F%2Flocalhost%3A5000
  
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_17.png" />
</p>

Entramos en herramientas de desarollador y nos sale un usuario del sistema

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_18.png" />
</p>

Usamos hydra con el usuario que sabemos del sistema

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_19.png" />
</p>

Hacemos un ls y vemos que hemos encontrado la flag de user

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_29.png" />
</p>

Buscamos la clave ssh de francisca para cambiar de usuario 

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_20.png" />
</p>

Dentro de esta clave SSH para conectarnos a ssh miramos los permisos del fichero

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_21.png" />
</p>

Miramos el archivo id_rsa es el archivo de ssh de francisca

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_22.png" />
</p>

Hacemos un ssh al usuario francisca 

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_24.png" />
</p>

Buscamos archivos del grupo dbadmin para escalar privilegios a root

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_25.png" />
</p>

Creamos un archivo head y ejecutamos backupdb. Esto nos permite entrar como root

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_27.png" />
</p>

Buscamos la flag de root y la mostramos

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_28.png" />
</p

## Feedback

La maquina esta muy bien , me ha sonprendido hacer consultas a la pagina web desde el archivo.

