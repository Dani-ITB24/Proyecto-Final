# Walkthrough

## Reconocimiento 

``Comenzamos haciendo un nmap para descubrir los puertos que estan abiertos. Vemos que tiene 3 puertos, ftp, ssh, http. Y vemos que las versiones de los servicios estan actualizadas y no son vulnerables.``

![](/Assets/walkthrough/2024-03-07_18-19.png)

``Accedemos a la pagina web, para ver si tiene algo interesante.``

![](/Assets/walkthrough/2024-03-07_18-21.png)

``Como no encontramos nada vamos a hacer fuzzing para descubrir subdirectorios ocultos.``

![](/Assets/walkthrough/2024-03-07_18-26.png)

``Encontramos un robots.txt y una carpeta donde se guardan los estilos de css.``

![](/Assets/walkthrough/2024-03-07_18-26_1.png)

![](/Assets/walkthrough/2024-03-07_18-27.png)

``Vamos a ver los estilos css por si tienen algo interesante.``

![](/Assets/walkthrough/2024-03-07_18-28.png)

``Encontramos la ruta de un posible archivo, así que vamos a buscarlo.``

![](/Assets/walkthrough/2024-03-07_18-28_1.png)

``Se nos descarga un archivo, que contiene lo siguiente:``

![](/Assets/walkthrough/2024-03-07_18-30.png)

![](/Assets/walkthrough/2024-03-07_18-34.png)

``Si nos decargamos la foto y comprovamos si tiene contenido oculto encotramos esto:``

![](/Assets/walkthrough/2024-03-07_18-41.png)

![](/Assets/walkthrough/2024-03-07_18-42.png)

``Conseguimos un archivo zip.zip pero tiene contraseña, asi que vamos a crackearlo con la herrameienta jhon.``

![](/Assets/walkthrough/2024-03-07_18-46.png)

``Dentro del zip encontrmos un archivo que nos da una posible ruta, y asi accedemos a ella encontrmos un panel de login para un panel de control.``

![](/Assets/walkthrough/2024-03-07_18-48.png)

![](/Assets/walkthrough/2024-03-07_18-48_1.png)

``Tras investigar el panel de control encotrmos que no podemos hacer nada, y tampoco podemos hacer fuerzabruta ya que esta bloqueado.``

![](/Assets/login.jpg)

``Así que vamos a intentar de vulnerar otro servicio:``

![](/Assets/walkthrough/2024-03-07_18-56.png)

``Podemos acceder al servidor ftp con el usuario anonymous, y en el encotrmos una archivo con las credenciales del panel de control.``

![](/Assets/walkthrough/2024-03-07_18-57.png)

![](/Assets/walkthrough/2024-03-07_18-58.png)

``Una vez en el panel navegamos por la pagina y encotrmos varias cosas interesantes, como un listado de usuarios y tambien una serie de acciones para realizar en el servidor.``

![](/Assets/walkthrough/2024-03-07_18-58_1.png)

![](/Assets/walkthrough/2024-03-08_17-33.png)

![](/Assets/walkthrough/2024-03-08_17-33_1.png)

``Todas las acciones estan protegidas con una contrsaña, menos una:``

![](/Assets/walkthrough/2024-03-08_17-34.png)

![](/Assets/walkthrough/2024-03-08_17-34_1.png)

``Inteceptamos la petición con BurpSuite y vemos que hay un parametro command el cual tiene un comando de la terminal de linux, así que vamos a intentar entrar po ahí.``

![](/Assets/walkthrough/2024-03-08_17-36.png)

``Funciona!``

![](/Assets/walkthrough/2024-03-08_17-37.png)


![](/Assets/walkthrough/2024-03-08_17-39.png)

## Explotaicón
``Tras intentar conseguir la reverse shell de distintos modos nada funciona, así que vamos a intentar subir u archivo php con una reverse shell.``

---

![](/Assets/walkthrough/2024-03-08_17-43.png)

![](/Assets/walkthrough/2024-03-08_17-43_1.png)

![](/Assets/walkthrough/2024-03-08_17-44.png)

``Ya tenemos el archivo listo, así que creamos un servidor web con python y intentamos copiar el arcchivo.``

![](/Assets/walkthrough/2024-03-08_17-51.png)

![](/Assets/walkthrough/2024-03-08_17-51_1.png)

``Vemos que usando wget el servidor no recibe ninguna peticion, así que vamos a interar otra manera.``

![](/Assets/walkthrough/2024-03-08_17-51_2.png)

![](/Assets/walkthrough/2024-03-08_17-52.png)

``Al hacerlo con curl si que tenemos la peticion, así que vamos a poner el atacante en escucha y a acceder al archvio malicioso.``

![](/Assets/walkthrough/2024-03-08_17-53.png)

![](/Assets/walkthrough/2024-03-08_17-54.png)

![](/Assets/walkthrough/2024-03-08_17-54_1.png)

``Ya estamos dentro.``


![](/Assets/walkthrough/2024-03-08_17-55.png)

## Post explotación

``Entramos como el usuario www-data, así que vamos a buscar si hay algun binario con suid, y todos parecen normales menos uno que si lo ejecutamos vemos lo siguiente:``

![](/Assets/walkthrough/2024-03-08_18-02.png)

![](/Assets/walkthrough/2024-03-08_18-06.png)

``Si nos copiamos la cadena haxadecimal 20 y la desciframos obtenemos lo que parece una contraseña.``

![](/Assets/walkthrough/2024-03-08_18-18.png)

![](/Assets/walkthrough/2024-03-08_18-22.png)

``Probamos la contaseña y accedemos como bumblebee.``

![](/Assets/walkthrough/2024-03-08_18-23_1.png)

![](/Assets/walkthrough/2024-03-11_16-37.png)

![](/Assets/walkthrough/2024-03-11_16-38.png)

![](/Assets/walkthrough/2024-03-11_16-41.png)

![](/Assets/walkthrough/2024-03-11_16-42.png)

![](/Assets/walkthrough/2024-03-11_16-46.png)

![](/Assets/walkthrough/2024-03-11_16-47.png)

![](/Assets/walkthrough/2024-03-11_17-09.png)

![](/Assets/walkthrough/2024-03-11_17-09_1.png)

![](/Assets/walkthrough/2024-03-11_17-10.png)