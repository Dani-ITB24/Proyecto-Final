<h1>A09-Fallas en el Registro y Monitoreo</h1>

<span style="color:black;">[ Valoración](#valoracion)</span><br>


Miramos a ver que puertos están abiertos.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-2.png)

Se ha encontrado lo siguiente: <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-3.png)

<br>

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-4.png)

Sabemos que la versión que hay instalada del Papercut es la versión 18.3. Así que hemos buscado su CVE

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-5.png)

De todas las vulnerabilidades ha habido que ha destacado en particular:
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-6.png)

Se ha buscado un exploit para explotar esta vulnerabilidad. Y se ha encontrado un github que te da un python para explotar esa vulnerabilidad.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-7.png)

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-8.png)

En el archivo python se ha mirado que hacia exactamente. Se ha visto que si se añade "/app?service=page/SetupCompleted" a la url se puede vulnerar la aplicación.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-9.png)

Se ha añadido ese texto a la url y hemos podido vulnerar la aplicación.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-10.png)

Se ha dado al botón iniciado sesión y se ha podido entrar al inicio de la aplicación sin necesidad de credenciales. Dentro de la aplicación se han encontrado los usuarios registrados y la impresora que usan.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-11.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-12.png)

Se estuvo mirando los datos de los usuarios creados y ninguno tiene información que nos valga la pena. Asi que nos quedaba la impresora, pero nos lo bloquea un aviso. Se pulso el botón de "más información" y nos lleva a una pagina sin salida. Asi que se ha optado por eliminar el div que nos bloqueaba.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-13.png)

Se ha podido quitar el aviso, asi que se ha entrado y se ha podido ver una contraseña pero con asteriscos.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-14.png)

Asi que inspeccionamos la pagina y ponemos que el campo de la contraseña sea text en vez de password. Y con esto tenemos el usuario y password de uno de los admin.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-15.png)

Al ver que puertos estaban escuchando, se vio que estaba el puerto 23 que suele ser el puerto que usa Telnet. Probamos con las credenciales que hemos obtenido.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-16.png)

Ahora que estamos dentro, vamos a ver que servicios están corriendo.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-17.png)

Vemos que el puerto 139 esta escuchando, se ha visto que este puerto lo suele usar smbClient. Se ha mirado si estaba instalado y de ser asi ver la version del samba que esta instalada. No se ha encontrado ninguna vulnerabilidad para la version que tiene en ubuntu.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-19.png)

Ahora vamos a probar si hay alguna cosa compartida.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-18.png)

Y como vemos que hay una carpeta llamada "videos". Vamos a intentar buscar esa carpeta para saber donde esta ubicada.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-20.png)

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-22.png)

Ahora ya sabemos donde esta ubicado el directorio "videos". Accedemos al directorio y vemos que hay un archivo .md que solo tiene permisos el usuario "lolito".

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-21.png)

Ahora descargaremos chisel para crear una conexión entre la máquina atacante y máquina victima.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-25.png)
 
Y crearemos un servidor http mediante python para poder descargarnos el chisel en la máquina víctima.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-24.png)

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-23.png)

Ahora escucharemos con el chisel.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-26.png)

En la máquina de la víctima estableceremos la conexión con el chisel para redirigir el tráfico del puerto de la víctima al puerto del atacante.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-27.png)

Cuando estén conectados veremos que nos dice que ya está escuchando ese puerto.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-28.png)

Ahora con msf6 haremos un ataque de fuerza bruta, para el ataque le ponemos la ip de la víctima y la wordlist que usaremos para ello.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-30.png)

Esperamos una par de minutos hasta que de con la contraseña. Después de un rato vemos que ha encontrado la contraseña que es "lamborghini".

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-31.png)

Ahora siendo usuario thegrefg vamos a intentar acceder con smb para ver los recursos del usuario lolito.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-32.png)

Una vez ahi miramos si está el archivo de videos y nos lo descargamos.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-33.png)

Una vez descargado miramos que es lo que contiene el archivo. Tiene pinta de ser una wordlist.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-34.png)

Con esta nueva worldlist vamos a intentar a sacar la contraseña con msf6. Pero antes tenemos que tener ese archivo en nuestra máquina atacante.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-35.png)

Y ahora realizamos el ataque de fuerza brutal. Y descubrimos su contraseña.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-36.png)

Ahora nos conectaremos con esa contraseña.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-37.png)

Vemos que hay un archivo python y si lo ejecutamos nos pone un juego del ahorcado.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-38.png)

Sabiendo que podemos ejecutar archivos python, vamos a hacerle que ejecute un shell para la escala de privilegios. Asi que miramos que librerías esta agarrando el archivo.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-39.png)

Cogemos el nombre de alguna de esas librerías y le ponemos el código para hacer un shell. Y ahora ejecutamos el archivo python pero con el usuario de ampeter para escalar a ese usuario. 

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-41.png)

Una vez ejecutado el archivo estamos dentro del usuario ampeter. Miramos a ver que hay dentro de donde estamos y encontramos la flag user.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-42.png)

Miramos que mas tiene el usuario ampeter.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-43.png)

Buscando encontramos varios directorios ".d". En un de los directorios hay varios archivos pero hay uno que destaca, que seria el archivo "hello".

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-44.png)

Ahora volvemos al home del usuario y una vez ahi vamos creamos un archivo malicioso que para usar la opcion checkpoint-action-exec para poder escalar como root.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-45.png)

<h1 name="valoracion">Valoración</h1>
De las máquinas que he realizado esta sin ninguna ha sido de las más elaboradas. Esta bastante bien diseñada ya que aplica con casi todo lo que hemos aprendido a lo largo de este curso y cumple perfectamente con la vulnerabilidad aplicada.