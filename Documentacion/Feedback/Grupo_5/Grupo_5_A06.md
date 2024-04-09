## Writeup

Escanemos los puertos para ver qué puertos están abiertos.

 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_1.png" />
</p>

Miramos la versión de los servicios en el contenedor y vemos que el apache es antiguo. Miramos de buscar una manera de atacar el apache y encontramos un script para atacarlo:

<p align="center">
<img  alt="drawing" " src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_2.png" />
</p>


Ejecutamos el script de la página web y nos sale el usuario y contraseña cifrado

<p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_3.png" />
</p>

Desciframos la contraseña

 <p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_4.png" />
</p>

Entramos por ssh a la máquina.

 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_7.png" />
</p>

Hacemos un ls y vemos la flag

 <p align="center">
<img  alt="drawing"  src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_6.png" />
</p>

Usamos sudo para entrar como el usuario root, se puede ver que no tiene permisos, sin embargo podemos ejecutar vim como sudo

 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_14.png" />
</p>

Ejecutamos vim para entrar como root

 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_15.png" />
</p>

Buscamos la flag de root y la mostramos
 <p align="center">
<img  alt="drawing" src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo2/Documentacion/images/Screenshot_16.png" />
</p>

## Feedback

La maquina cumple con todos los requisitos pero se puede mejorar la difilcutad para hacerla mas dificil.

