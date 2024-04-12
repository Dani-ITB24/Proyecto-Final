## Writeup

En primer lugar hacemos un scan para ver los puertos abiertos:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/a9351656-d034-430c-8186-2cb4052a70d5)

Miramos qué servicios y versiones están corriendo en los puertos:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/6e3aa39a-650c-4f36-9fec-7351f1656769)

En el puerto 80 no hay alojada ninguna web, en el puerto 8080 sí:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/4d9ec614-d77e-4cf6-8215-fd15f671f122)

Veo que hay distintos servicios corriendo entre los que encuentro un panel de inicio de sesión "secreto":

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/44f4ef86-2006-408e-9ad9-2b8829d386bd)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/07dd6df7-0f11-4243-a5ff-a63d781f6ed0)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/85326aa7-6ad5-43d3-add2-26d853d68d44)

Parece que se puede restablecer la contraseña así sin más:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/ce828319-d14c-4902-82b8-e496f401bec2)

Reseteamos la contraseña:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/e903cfda-2203-4912-836a-556f2aabd29b)

En el menú de la izquierda aparece un menú nuevo:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/67dff010-e402-484b-9508-207cb2a34ee8)

Consigo ejecutar una reverse shell y ya estoy dentro de la máquina:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/da599cee-e481-429f-b0f9-4d346cc1e946)

No encuentro ninguna flag user.txt así que intento escalar privilegios.

Encuentro un SUID de Python3.9 (explotable) y lo utilizo para escalar privilegios a root:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/24e85eaf-3391-4a46-8616-d32a8b4b1bba)

Escalo privilegios:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/e6e37d6e-f4ca-46b4-a69f-8ae57c0d4d41)

Parece que tampoco hay flag:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/d30c6f4f-4b39-49a7-a70b-02ed601d9f73)

Encuentro las credenciales de inicio de sesión de la base de datos:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/aeaca413-7dae-4d9b-8955-a9125fe7a04a)

Accedo y encuentro unas credenciales nuevas:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/eb37088a-470d-4e7e-9183-e4e34bed9ee4)

Tras modificarlas ya puedo acceder al login anterior e iniciar sesión:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/bd0a7a3e-83fc-439d-8c21-3b56c8dc530e)

Y ya estamos dentro:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/083e680b-f10e-4a95-b273-82b31799fe4c)


## Feedback

El CTF cumple con el objetivo principal, el montaje ha sido distinto al de los demás grupos sin embargo no ha sido complicado. Faltan las flags "user.txt" y "root.txt". También me hubiera gustado que fuera un poco más largo ya que es bastante sencillo de finalizar.
