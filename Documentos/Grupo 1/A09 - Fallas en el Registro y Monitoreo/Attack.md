<h1>A09-Fallas en el Registro y Monitoreo</h1>

Miramos a ver que puertos estan abiertos.

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

Se ha dado al botón iniciado sesión y se ha podido entrar al inicio de la aplicación sin necesidad de credenciales. Dentro de la aplicacion se han encontrado los usuarios registrados y la impresora que usan.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-11.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-12.png)

Se estuvo mirando los datos de los usuarios creados y ninguno tiene informacion que nos valga la pena. Asi que nos quedaba la impresora, pero nos lo bloquea un aviso. Se pulso el boton de "más inforamación" y nos lleva a una pagina sin salida. Asi que se ha optado por eliminar el div que nos bloqueba.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-13.png)

Se ha podido quitar el aviso, asi que se ha entrado y se ha podido ver una contraseña pero con asteriscos.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-14.png)

Asi que inspeccionamos la pagina y ponemos que el campo de la contraseña sea text en vez de password. Y con esto tenemos el usuario y password de uno de los admin.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-15.png)

Al ver que puertos estaban escuchando, se vio que estaba el puerto 23 que suele ser el puerto que usa Telnet. Probamos con las credenciales que hemos obtenido.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-16.png)

Ahora que estamos dentro, vamos a ver que servicios estan corriendo.
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

Ahora descargaremos chisel para crear una conexion entre la máquina atacante y máquina victima. Y crearemos un servidor http mediante python.

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-23.png)
 
