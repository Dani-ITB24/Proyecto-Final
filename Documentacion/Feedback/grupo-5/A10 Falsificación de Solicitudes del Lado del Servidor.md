# A10 - SSRF

## enumeración de puertos

primer escaneo con nmap

![vm1-imagen1](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/30f0112c-7015-40a7-ab41-cf78a750443a)


### web 80
Realización de búsqueda de directorios con gobuster

![vm1-imagen2](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/896e1a35-a936-4b90-b98f-6e85504cfc1b)


si ponemos google nos aparece la web de google en otro formato, y si intentamos buscar algo en google no sale nada, con lo que parece que realiza como proxy, mostrando solo la web solicitada.
### web 5001
Realización de búsqueda de directorios con gobuster

nos indica que no tenemos acceso
### ssh 22
esta el servicio ssh con la versión 8.9


## Investigación/pruebas
Se intenta aprovechar el proxy para realizar la consulta hacia las dos web y en la web del puerto 5001 aparece una web distinta, si miramos su código vemos que hay un mensaje.

![vm1-imagen3](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/a514fd2a-88ce-4678-af82-f59904026116)

con lo que entendemos que hay 3 personas que tienen acceso a este server, Francisca y Paco, e indica que Paco tiene una contraseña débil.


### Fuerza bruta
realizamos un ataque de fuerza bruta por ssh al usuario ssh

![vm1-imagen4](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/62e0ffd8-4dc1-429e-a32f-226e67247ac6)
![vm1-imagen5](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/d9ffaa6f-35b2-4bcf-bac6-a00d34b88705)

investigando la máquina para ver métodos de y escalar a usuario de root, con lo miramos de intentar movernos al otro usuario que suponemos que es Francisca.

con el siguiente comando podemos ver todos los ficheros a los que tenemos permiso de lectura y/o ejecución, con lo que lo usaremos en directorios específicos en el que sospechamos de alguna información relevante.

find /etc -type f -perm /u=r -exec ls -l {} \;

Con este comando iremos modificando los filtros de las búsqueda como el permiso de reader, la ubicación de la ruta de la busqueda. Con esto encontramos un fichero llamado id_rsa que creemos que el la clave para acceder con el otro usuario y lo probamos. Al intentar hacer login vemos que nos pide la passphrase, con lo que con el john the reaper lo intentaremos descifrar el hash.

![vm1-imagen6](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/cf4f052e-e72b-44c4-913a-912b8f456dee)
![vm1-imagen7](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/b4fd3844-d721-4211-a543-e0642300ce6b)



## Subida de privilegios

Investigamos los permisos y grupos del usuario y vemos que pertenece a un grupo de dbadmin y vemos a qué permisos tiene este grupo con el siguiente comando iremos modificando el permiso de ejecución indicado en el comando

find / -type f -group 'dbadmin' -perm /g=x -exec ls -l {} \; 2>/dev/null

Aparece que tiene permisos de ejecución en un binario de /usr/bin/backupdb1
![vm1-imagen10](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/f5722671-9366-43a6-8784-fa0ec162225e)

Si probamos a ejecutar este el binario nos crea una carpeta en la ubicación /var/www/html
![vm1-imagen11](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/d669c9b1-a666-4b1a-b934-44e3cfd2c134)

para revisar esto, si le hacemos cat /usr/bin/backupdb1 podemos ver el contenido del fichero y vemos que crea una carpeta y con un fichero con contenido y después lo muestra con el comando head. 

![vm1-imagen9](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/ebe81bb7-d5bb-47cb-8ede-a82e3601b6ec)

con lo que procedemos a crear una nueva funcion que se llama mkdir indicando que habra una shell y exportarla, pare que cuando lo ejecute el backupdb1 habra un shell en vez de crear la carpeta.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/978b2c23-8bd3-477c-9e3f-aeeaaa3525ca)


## Feedback 
Para usar el entorno he tenido que redireccionar el puerto 5000 porque lo estaba haciendo el socket de docker, la parte mas compleja  o de llegar seria la parte de root, darte cuenta que tienes que cambiar de usario y una vez que encuentras el fichero backupdb1 es facil avanzar.
