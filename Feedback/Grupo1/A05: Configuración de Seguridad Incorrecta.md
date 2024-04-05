![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/e6983039-7225-4e31-942e-548ca81442a0)

# Explotación

Primero hice un nmap para saber que servicio habia activos.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/02cabe21-966d-4bc0-a9ea-e4b58a60cf97)

Una vez que se que servicios hay me doy cuenta que hay un servicio FTP que puedos acceder como anymous.

Una vez que hace el servicio FTP como anymous vemos que directorio o ficheros hay.

Vemos que hay un directorio que se llama **...** que lo hacen para despistar.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/79df155b-acc0-4336-baed-c1a250252e5e)

Una vez que hemos accedido al directorio **...**, vemos que dentro de ese dictorio hay un direcotrio que se llama **.-**.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/800a2023-cf31-4ba7-8382-3e5ca44d9096)

Una vez que entramos al derectorio **.-** vemos que dentro de dicho directorio se encuentra un fichero que se llama **cred.txt**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/7b39c44b-9a05-426c-bba6-6582e44c90d7)

Como no podemos ver dicho fichero lo que haremos es intentar descargarlo para nuestra maquina local con el comando get.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/299d7cb3-dd73-432f-8348-dc8e9f18e790)

Y ahora vamos a ver que contenido tiene el fichero **cred.txt** que hemos descargado. Y vemos que hay dentro del fichero supongo que es un usuario y una contraseña que está codificada en base64.

Nos guardamos la información del fichero por si hay que usarla en algún momento.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/754b40e8-ec94-47e3-839f-9210c74b13b9)

**investiga:La-M3j0R-ContR4SeNa-d3l-muNd0.**

Ya que hay una más en servicio FTP, nos diregimos al servidor apache que aloja la siguiente web. Dicha web no hay nada que buscar haya que es una Rabbit Hole para perder el tiempo.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/abb001b7-4a7b-42c0-b3d8-acb1fcf26e67)

Ahora lo que haremos es si encontramos direciones oculta en la web. Y para eso haremos ffuf que es una herramienta que permite realizar un escaneo de fuerza bruza a una dirección web.

Como vemos en la siguiente imagen una vez realiado el ffuf, vemos que nos encuentra las siguiente direciones oculta.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/426bd608-2a85-4174-ac11-6fb3a0809b8d)

Como vemos los resultado que ha dado la herramienta ffuz, vemos que un directorio que se llama **ccs**. Una vez dentro vemos que salen varios ficheros **.css** que si abres hay el siguiente mensaje.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/b0911155-6454-40a4-9dc8-ca8a7073e8e0)

Eso quiere decir que busquemos la url http://172.17.0.2/notas.md. Cuando pondemos dicha url de nos descarga el siguiente fichero notas.md. Con el siguiente contenido, de una conversación entre dos persona una se llama maya y la otra no se sabe ya que no sale en la conversación.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/62b9b423-5d4a-4a22-8b4c-b1fdb9b8380b)

A continuación nos diregimos la dirección url http://172.17.0.2/foton.jpeg y nos sale la siguiente foto. 

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/1cbbfe0b-0228-4854-8c0d-0af33b19d01f)

Lo que haremos ahora es descargar la foto de forma local para poder analizarla, a ver si encontramos alguna información más.

Para descargar la imagen lo haremos con el curl de la siguiente manera como vemos en la imagen
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/a39756e2-f97d-4ab0-a6c3-f8ddbb076ba7)

 Ya teniendo la imagen de forma local lo que haremos es ver si hay algo de información oculta dentro del imagen, para comprar esto tenemos que usar la herramienta **steghide** para ver si encontramos algo.

Como vemos en la imagen hay un zip oculto con el nombre zip.zip que está con contraseña.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/0797e6ea-95f6-4746-9e16-88317f1f7277)

Ahora lo que haremos es extraer el zip que esta dentro de la imagen con el siguiente manera.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/f94ffd04-a71c-4562-aad8-f96a73c0df31)

Ya teniendo el zip de forma local, lo que haremos es usar zip2johnn para calcular el hash de la contraseña del zip.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/e86f223d-47ad-44f2-ac09-f6eb240de57d)

Una vez calculado el hash del zip lo que haremos es ahora crackear la contraseña con la herramienta john.

**Nota: Me sale así porque ya decifre la contraseña anteriormente**

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/5df929e2-9ddb-4d42-89b9-5b326408303c)

Una vez que ya sabemos que la contraseña del zip es **brasil**, lo que haremos es decomprimir el zip.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/44c2b130-d924-4e9b-9564-6beb2d125181)

Una vez decomprimido, vemos que hay un fichero que se llama **propositosaño2024.txt**, vamos a ver que contiene dicho fichero. 

Como vemos sale un mensaje que dice, hay que mejorar el panel de la web. 

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/b3b22db2-6e5a-4aaa-b376-3661d55148ee)

Nos dirigimos en dicho panel web. Y nos sale un login en la web.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/22c8f853-e05b-4e74-bc80-485de7e89b42)

Comprobamos si el usuario y contaseña que obtuvimos en el fichero del servidor FTP funciona para acceder al panel.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/0fd9b6b2-d174-42d1-9821-d8aba792b7e4)

Como vemos si funcionó, ahora vamos a la sesion de config que es la que nos interesa. Vemos que podemos cambiarle el estado del servicio apache, en la mayoria pide contraseña menos en el **estado del servidor apache**. Que nos sale lo siguiente

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/92c4b278-6003-4af8-9af4-c5872c6d509b)

Sabiendo esto nos ponemos investigar esta parte del panel y encontramos que para mostrar el mensaje usa un comando como vemos en la imagen. 

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/98f1ecbd-2e88-4519-b223-dd4209793c47)

Esto nos da la idea de que intercetando la petición podemos cambiar el comando y poder crear un fichero para ejecutar la revershell.

Una vez que hayamos preparado el BuerSuit, lo que tenemos es que abrir abrir un servidor http en nuestra maquina local donde tiene la reverse shell

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/e01aaef0-2dbb-41e8-9497-c27708106dec)

Después abrimos el BuepSuit que nos permite intercertar peteciones y poder cambiar su contenido. Ya teniendo la petición interceptada, lo que haremos es lo siguiente con el comando curl pasarle el nuestra revershe y entrado un fichero que contenga el contenido de nuestro fichero malicioso. Como vemos a continuacuión.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/67a2c03f-2eb7-458a-88cc-b41ef8935e53)

Una vez que hayamos mando la petición con el codigo malicioso comprobamos si a funcionando lo primero que haremos es abrir con nc un servidor que estará escuchando por el puerto 5000.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/a0e44147-120d-4935-a924-74d26874a500)

una vez dentro lo que haremos es ir a la dirección web y buscar a ver si se a subido la reverse shell como vemos en la imagen

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/c3aac6af-2516-46e5-9372-6817077e042e)

Si encuentra en el servidor de la web nuestro revershe y volvemos al servidor que dejamos escuchando, saldrá lo siguiente que indica que hemos conectado mediante una revershell.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/5cfdc8bd-cc13-4451-bff2-3e6c74a99d5e)

Ya dentro como www-data busca permisos SUID en el servidor y encontramos un permiso que esta em binario

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/793064ce-8623-4d07-a16c-0054c08efa70)

Para saber lo que contiene dicho binario, lo haremos con el comando xxd que nos permite crear un volcado helx para saber que contiene el binario. Como vemos en la imagen cogemos el hexadeximal de 20 que es el que contiene una contraseña.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/1f82a298-3b49-4e86-8c9b-11c12c0ae781)

Una vez que cogemos el numero 20, lo llevamos a cyberchef para decodificarlo y nos sale la siguiente.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/ee0718d6-92d1-47ce-8b0b-b14635327a58)

Ya que dice que sale el nombre de la maya, comprobaremos si es su contraseña, haciendo SSH

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/266ddda5-2cf4-4f73-a7b8-11c1cf4cb242)

Una vez que hemos comprobado si es la contraseña maya, que no lo es, miramos el home y vemos el usuario bumblebee. Lo intetaremos con él

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/8fca23d5-1c76-41d7-9f30-9000d0f6fa58)

Vemos que la contraseña que estaba encondida en el binario pertenecia al usuario bumblebee.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/07233f5d-eb6e-4a5e-874a-89924b122e75)

Ya dentro del usuario bumblebee vemos que tiene un fichero que se llama file.txt que contiene la private key de la contraseña del posible usuario a maya.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/8f011ac0-6983-40f0-ba8a-06087a72a876)

Lo que intentaremos ahora es crackear el private key para poder acceder a maya.

Lo primero que haremos es guardanos el contenido del fichero file.txt de manera local.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/5a66fac7-4bdd-4d97-aa85-efce84d0b5f3)

Después generamos un hash con ssh2john para posteriormente crackearlo.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/0e7fcc3f-da67-439d-8640-dbff2083f0dc)

Como vemos los hemos crackeado con john el hash de private key.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/6e6cb488-3c02-4857-9953-c7e386d73ee2)

Ahora vamos a intentar hacer login con maya.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/2f192b0e-8fe1-4fe2-a6f2-442160b6c658)

Una vez que hayamos hecho login con maya, lo siguiente que haremos es buscar permisos SUID.

Encontramos un permiso SUID con wget en el home de maya

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/a47629db-f69f-4836-bfbd-4b929303168a)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/8ebc9609-02d7-4050-993c-a01c5e2032f9)

Ya identificado el SUID, nos vamos a GTFobins para buscar como ejecutar un bash haciendo pasar por root y encontramos lo siguiente.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/da9b0841-882c-4770-a13a-8b03b4ac22f0)

Como vemos en la imagen inferior, como accedimos como root.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/5413bc90-52ca-447d-b9f0-5258cd6d279b)

Ahora buscamos la flag de root, que se encuentra /root con el nombre de root.txt

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/ea9116d8-463e-49fc-87ea-87b42342e9cb)


# Feedback

* En general la primera maquina del grupo1 está muy bien implementada ya que usas muchos conceptos que hemos usado a lo largo del curso. Tanto como la maquina web y la estructura del servidor bien implementada. La maquina no están facil pero tampoco es dificil. Ya que todo es un poco rebuscado, haciendolo más entretenido a la hora de realizarlo.
