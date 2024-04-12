# Explotación

Lo primero que haremos es ver que servicios y que puerto están abierto. Para eso usamos nmap como vemos en la siguiente imagen.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/36902761-cfea-480e-b6d8-70955cf33222)

Como vemos en la imagen hay una apache activo, esto significa que hay una web activa, para eso vamos a comprobarlo.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/e9dd9f95-97cb-4418-9543-6ecaeb25f25a)

Sabiendo que hay una web, lo que haremos es intentar buscar directorios oculto dentro de la web, y para eso lo haremos con la herramienta ffuf que nos permite hacer un escaneo de fuerza bruta con directorio.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/ea366743-adc6-4225-b9b7-5a020ed919c1)

Como vemos en el escaneo, hay un directorio que se llama **farm** ahora comprobaremos que hay dentro.

Y encontramos que es un login y vemos si es vulnerable.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/b0937ca7-b680-4dad-9f2a-0df35b2f0828)

Primero entramos al burpsuite, lo enviamos al Intruder para realizar el ataque de fuerza bruta al login

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/99014d59-1967-4a36-93dc-f2d3f1fe8516)

ya dentro del intruder haremos el ataque de fuerza bruta para poder iniciar sesion y para esto ponemos en **attack type** cluster bomb que permite hacer fuerza bruta a diferente payload.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/9eb3b32c-306d-44af-ae18-f9c21e7f164a)

En la siguiente imagen selecionamos el primer payload que pertenece al username y le damos a "load" para cargar el diccionario.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/74b33a34-9e17-4605-b0a5-534bf8f4daf9)

Ahora vamos al segundo payload que pertence a la contraseña y hacemos los mismo que el anteior payload.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/0d358d76-2a14-4eab-ab8a-4f10adfe9d9d)

Una vez inicimos el ataque tendremos que encontrar la linea del "status mode" que contenga el numero "302". Está linea nos dirá que hemos hecho login mediante fuerza bruta.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/b7683a85-5d8b-46ca-945f-65e9bceb6eb7)

Ya sabiendo la contraseña y el username del usuario, vemos que en está pagina podemos subir cosas
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/6d7a722e-e14c-45d0-91e9-e2d7a5f02fd9)

Como vemos subimos la revere shell

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/af008948-40cd-419b-a717-80a94f7c2548)

Y nos dice que se creo en "/uploadfolder" ahora vamos a ese directorio

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/bf05bffa-5478-449b-921d-c7d98083d7f5)

Como vemos que se a subido nuestra revere shell

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/0e0b1e72-16c0-4d47-8a2e-4e8e7a169c17)

Nos ponemos a escuchar en el puerto 5000 con netcat y hacemos la conexion

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/e39be302-6cbd-4acf-82e0-8e618c4912ff)

Una vez dentro comprobamos que hay en el directorio que estamos, y vemos que hay una pagina que se llama bancocredencialesprivado.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/81b9b9ff-1540-4c2e-9ec3-551d04f623e7)

Ya iniciado la web, nos encontramos otro login,

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/ec58d740-89bf-4e94-a7df-828a53a3abca)

Intentamos ahora hacer SQL Injection al login

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/2e8c3d54-f9cd-475e-89d6-a90e17b35637)

Como vemos pudimos acceder a la pagina, y nos sale 3 usuario con la contraeña codificada en base64

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/159a685d-a062-4983-a4ce-fa984f597770)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/ce6d10d3-d50a-497c-85ad-09cc42efd419)

Entramos por ssh con el usuario "pastorJose" y comprobamos si hay permisos SUID y no encontramos nada 

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/b5655b13-350e-4d3a-ae1b-b3aacdb4b7dd)

dentro del usuario "pastorJose" iniciamos un servidor http.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/dd750836-54f7-4de4-ac8a-e3b94b87cd93)

Aqui hacemos un "wget" para poder descargar desde el usuario "pastorJose" el zip a nuestra pagina local. Como vemos se descarga correctamente

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/196a6b8a-663b-460e-95e0-8de65883fccd)

Como el zip está incriptado, lo deincriptamos con zip2john para genera un hash para despues crackearlo

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/db4f63e8-bd1f-4ff2-bff8-ff1f6d9048d9)

Una vez geenrado el hash se lo pasamos a john, cogemos el dicionario rockyou.txt, y vemos que la contraseña es "pgscantfly"

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/333ffe70-a418-44f4-8c05-fc388c42476e)

Ya descomprimido el zip con tiene un fichero que se llama granjero.txt

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/2f8f08c9-52f6-4c26-8d5a-23ec7ea33fea)

El fichero granjero.txt con tiene el usuario y la contraseña en base64 del usuario granjero

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/137c18a4-e8e9-4a38-afb4-f2c987346208)

Entramos por ssh con el usuario granjero y vemos el contenido de la flag "user.txt"

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/da287e3f-dcfe-4a89-9f85-0d35a6174f86)

Dentro del usuario granjero hacemos id para comprobar que usuario y grupo pertenecemos y vemos que el usuario granjero pertene al grupo "sudo"

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/6926a006-8c74-4190-b6e1-54078fd29c94)

Ahora hacemos "sudo su" para acceder como root.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/6fd845ea-4712-4ac4-983f-95e609c57721)

Una vez que somos root buscamos la flag de root en "/root".

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160489903/af86bf55-40c1-465f-9836-41c1259b82d7)

# Feedback

* En general, la primera máquina del grupo2 está muy bien implementada, ya que usas muy bien la vulnerabilidad implementada, porque usas una manera diferente de usar el burpsuite. Las webs están muy bien gráficamente. Después acceder a los usuarios es muy fácil para lo que yo me imaginaba, y acceder a root es muy fácil.
