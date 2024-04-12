# Explotación

Como vemos en la imagen hay diferente servicio y accedemos a arbusto-php.local
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/d453698d-8406-42d3-bcf8-c972da0fc6fa)

Y nos encontramos que nos sale la ip de la pagina

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/6c0eb183-a9c4-4d7d-b18d-9c80157d2980)

Ahora accedemos a la pagina y nos vamos al login

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/d9e81f33-d09f-4958-9c87-590fa2cf6fad)

Y nos sale que podemos recuperar la contraseña y le damos click

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/a8269005-7486-4444-bbd2-c17bd1e818e5)

Ahora nos sale un nuevo login para poder recuperar la contraseña y le damos a enviar

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/c2f1514b-3964-4333-ab19-005057d4e99d)

Una vez que le damos a enviar nos sale un nuevo panel en la maquina web que se llama "shrek-master"

Entramos a ese panel y vemos que hay un command panel para poder ejecutar comando

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/0bceb5ae-9ff0-4e6a-b13b-7fbceaedcfd9)

Buscamos en reverse shell generator una reverse shell en python3 como vemos en la imagen

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/8928b7fe-90d3-4049-944e-2d1d192a0156)

Ahora copiamos la reverse shell y la pegamos en el command panel

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/066dc5de-54df-43b9-b9e6-74f0d41e9c6f)

Una vez que hemos escuhado con netcat en el puerto 5000 y ejecutamos el comando, nos hara la revere shell

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/1673983f-b253-4ddf-819b-5952924d596b)

Ahora buscamos permisos SUID y encontramos python3.9

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/d3c86d28-0598-411d-a90b-3d412a1ca32c)

Nos vamos a gtfobins y buscamos vulnerabilidad con python

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/b6b1e3c6-e299-4504-8931-2e1a22532a42)

Ahora nos vamos a la sesión de SUID en python

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/f39d738d-2955-4640-a60b-3ca3657652ef)

Ahora ejecutamos el siguiente para poder general un bash pero haciendo pasar por root. Como vemos comprobamos que somos root.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/e2bc259f-6ee2-4db3-a60a-f714166bccf3)

Ahora accedemos a la base de datos para poder cambiar la contraseña al admin

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/7d59b859-d950-4666-acaa-3296292f0fd2)

Miramos la tablas que hay, y la unica es people

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/73751f42-9f24-4315-8b34-9e93049660e0)

Hacemos un select para ver el contenido de "people". Como vemos solo hay un usuario y su contraseña

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/cf5a2230-a015-4b3f-a60a-5a3b04590ddc)

Aqui cambiamos la contraseña del usuario "shrek-master" y comprobamos si se ha cambiado correctamente

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/1e130e79-3b6e-4333-a546-1a0250c09415)

Ahora nos vamos a la pagina web y vemos que podemos acceder con el usuario con la credenciales.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/0d99577c-f130-4f50-abc1-79b9ddb25ab1)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/d6c3fa82-5a8a-45a0-b18f-1aeadcf71901)


# Feedback 

Bueno la maquina es muy regular, ya que es muy facil porque implementa muy poco la vulnerabilidad 


