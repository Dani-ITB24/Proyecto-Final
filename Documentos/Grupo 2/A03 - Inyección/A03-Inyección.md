
Hemos mirado que puertos estaban abiertos.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-1.png)

Una vez sabiendo los puertos abiertos, hemos comprobado que contenia la web. Se ha mirado si habia algo escondido dentro del codigo pero no se ha encontrado nada.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-2.png)

Como no se ha encontrado nada dentro de la web, vamos a ver que directorios tienen oculto. Para ello hemos tenido que hacer un fuzzing, para encontrar los directorios ocultos. Y se ha encontrado una url.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-3.png)

Nos hemos dirigido a esa url y hemos encontrado un login.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-4.png)


Se ha estado mirando el codigo de la pagina y no se ha encntrado nada interesante. Asi que se ha hecho un dirb para ver que mas guardaba esta web. Y aqui hemos descubierto un directorio llamado "database".

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-5.png)


Al acceder a esa url vemos un archivo sql y nos hemos descargado el archivo sql. Una vez abierto se ha descubierto un usuario admin con una contraseña cifrada.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-6.png)


Con la web "Identify hash types" hemos sabido que esta cifrada en sha1, asi que procedemos a descifrarla.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-7.png)


Ya descifrada iniciamos sesion correctamente.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-8.png)
























Se ha encontrado el archivo flag.txt dentro de root.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-flag.png)
