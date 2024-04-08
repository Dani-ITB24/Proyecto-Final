
Hemos mirado que puertos estaban abiertos.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-1.png)

Una vez sabiendo los puertos abiertos, hemos comprobado que contenía la web. Se ha mirado si habia algo escondido dentro del código pero no se ha encontrado nada.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-2.png)

Como no se ha encontrado nada dentro de la web, vamos a ver que directorios tienen oculto. Para ello hemos tenido que hacer un fuzzing, para encontrar los directorios ocultos. Y se ha encontrado una url.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-3.png)

Nos hemos dirigido a esa url y hemos encontrado un login.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-4.png)


Se ha estado mirando el código de la página y no se ha encontrado nada interesante. Así que se ha hecho un dirb para ver que más guardaba esta web. Y aquí hemos descubierto un directorio llamado "database".

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-5.png)


Al acceder a esa url vemos un archivo sql y nos hemos descargado el archivo sql. Una vez abierto se ha descubierto un usuario admin con una contraseña cifrada.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-6.png)


Con la web "Identify hash types" hemos sabido que está cifrada en sha1, así que procedemos a descifrarla.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-7.png)


Ya descifrada iniciamos sesión correctamente.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-8.png)

Una vez ahí intentamos ver de que manera podemos vulnerar esta página. Y se ha encontrado una forma de vulnerar la página, que es a través de la sección "manage pigs" podemos crear una nuevo sección y en un de los campos para rellenar se puede subir cualquier tipo de archivos, ya que no verifica la extensión de archivo. Ahí subiremos un archivo php para hacer un reverse-shell.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-9.png)

Una vez que hayamos subido el fichero, nos saldrá una notificación de que se ha subido correctamente en una dirección. Accedemos a la dirección que nos dice y vemos los archivos que hay y el que hemos subido.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-10.png)

Antes de ejecutar el archivo php, tenemos que poner a escuchar el puerto que hemos puesto en el php.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-11.png)

--------------------Problema-------------------- <br>
Habido un problema, cuando pusimos el puerto ha escuchar y ejecutamos el archivo php en ningún momento se llega establecer la conexión. Se que da el puerto escuchando y el php pasado nos da un time out o se queda en pantalla en blanco. <br>

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-12.png)

Este problema lo comunicamos con los creadores del contenedor y nos dio un par de soluciones que tampoco funcionaron.
<br>
------------------------------------------------<br>

Para poder seguir con el ataque hemos tenido que iniciar la sesión como www-data. Una vez que estemos allí, nos hemos dirigido donde está subida la web para ver que más cosas tienen guardada. Una vez ahí encontramos otra dirección.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-13.png)

Accedemos a la dirección que hemos encontrado y encontramos otro login.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-14.png)

En este login vamos a probar a hacerle el sql injection.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-15.png)

Una vez dentro vemos que hay unas credenciales puestas.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-16.png)

Vemos que las tres contraseñas están cifradas, se ha comprobado mediante una web que están cifradas en Base64.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-17.png)

Y las desciframos las contraseñas.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-18.png)





Se ha encontrado el archivo flag.txt dentro de root.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%202/A03%20-%20Inyección/Assets/maqA03-flag.png)
