# WriteUp A08

Lo primero que hacemos es un escaneo con nmap.

![](image-25.png)

Como solo hay una pagina web y esta nos muestra la default de apache vamos a hacer fuzzing para recolectar mas informacion.

![](image-26.png)

Nos encuentra un wordpress, así que vamos a escanearlo con wpscan.

![](image-27.png)
![](image-28.png)

Con esto conseguimos un usuario un pluguin que pude ser vulnerable.

Vamos a usar este repositorio para intentar explotarlo.

https://github.com/p0dalirius/CVE-2016-10956-mail-masta.git

Con esto podemos leer archivos de la maquina

![](image-29.png)
![](image-30.png)

Ahora vamos a buscar archivos de configuracion de wordpress que contienen credenciales para posibles inicios de session.

![alt text](image-32.png)
![](image-31.png)

Con estas dos credenciales vamos a intentar inicar sesion.

![alt text](image-33.png)

Conseguimos entrar como alfredo haora vamos a intenar modificar una pagina para ejecutar php.
Para ello vamos a crear un servidor en nuestro kali y vamos a intentar hacer una peticion desde el wordpress. Vamos a editar el archvio header.php

![](image-35.png)
![](image-36.png)

Ahora que podemos ejecutar comandos vamos a crear una reverse sehll
Tras intentar muchos comandos hemos encontrado uno que funciona.

![](image-37.png)

![alt text](image-38.png)

Vamos a intentar cambiar de usuario con las credenciales que tenemos.

![alt text](image-39.png)

Ya somos daniel

![](image-40.png)

Ya tenemos la flag de usuario, ahora vamos a intentar ser root.

![](image-41.png)
![](image-42.png)



