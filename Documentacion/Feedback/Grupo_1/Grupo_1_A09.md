## Writeup

Lo primero que vamos hacer es un nmap para descubrir los puertos abiertos.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_30.png" />
</p>

Entramos en el navegador y miramos lo que hay en la página web.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_31.png" />
</p>


Buscamos la vulnerabilidad del servidor PaperCut.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_32.png" />
</p>

Probamos de poner /app?service=page/SetupCompleted en la url del navegador para ver si nos deja entrar en la página web.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_33.png" />
</p>

Hemos entrado dentro.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_34.png" />
</p>

Vamos al apartado device, vemos que hay un dipositivo pero no podemos acceder él.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_35.png" />
</p>

Vamos a inspeccionar elemento y borramos el div que nos molesta, a continuación entramos.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_36.png" />
</p>

Volvemos a inspeccionar elemento para borrar otro div.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_38.png" />
</p>

Podemos ver un usuario y una contraseña.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_39.png" />
</p>

Usamos telnet para conectarnos usando el usuario y contraseña que hemos conseguido.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_40.png" />
</p>

Miramos los servidores que están corriendo dentro del contenedor.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_41.png" />
</p>

Como hay un servidor smb miramos qué recursos están compartidos. Vemos un fichero pero no tenemos permisos.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_42.png" />
</p>

Usamos el comando mfsconsole para mirar mas vulnerabilidades.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_43.png" />
</p>
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_44.png" />
</p>
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_45.png" />
</p>

Intentamos hacer un telnet con el usuario que hemos conseguido pero falta la contraseña.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_46.png" />
</p>

Usamos mfsconsole para descubrir la contraseña del usuario.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_49.png" />
</p>
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_50.png" />
</p>

Intentamos otra vez conectarnos con el usuario lolito.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_51.png" />
</p>


Miramos lo que podemos hacer, miramos si hay mas usuarios y pasamos al usuario ampeter.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_52.png" />
</p>

Miramos el usuario ampeter y descubrimos una flag.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_53.png" />
</p>

Entramos en el usuario root y buscamos la flag.

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_54.png" />
</p>

## Feedback
