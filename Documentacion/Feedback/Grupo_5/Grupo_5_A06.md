 Escanemos los puertos para ver que servicios estan activados.


 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_1.png" />
</p>
Miramos la version de los servicios en el contenedor y hemos que el apache es antiguo miramos de buscar una manera de atacar el apache , encontramos un script para atacar el apache
<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_2.png" />
</p>



Ejecutamos el script de la pagina web y nos sale el usuario y contraseña cifrado
 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_3.png" />
</p>

Desencriptamos la contraseña.

 <p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_4.png" />
</p>

Entramos por ssh a la maquina.

 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_7.png" />
</p>


Hacemos un ls y vemos la flag

 <p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_6.png" />
</p>

Usamos sudo para entrar como el usuario root se puede ver no tiene permisos pero si que tiene permisos es el vim
 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_14.png" />
</p>

Ejecutamos vim para entrar como root
 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_15.png" />
</p>

Buscamos la flag de root y la mostramos
 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/grupo5/Screenshot_16.png" />
</p>