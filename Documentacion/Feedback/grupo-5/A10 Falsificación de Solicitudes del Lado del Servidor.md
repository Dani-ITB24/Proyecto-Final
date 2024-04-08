# VM 2 A10 - SSRF
para levantar la maquina se ha tenido que redireccionar el puerto 5000 hacia el puerto 5001 porque estaba e uso.

## enumeracion de puertos

primer escaner con nmap
vm1-imagen1
### web 80
Realizacion de busqueda de directorios con gobuster
vm1-imagen2
si ponemos google nos aparece la web de google en otro formato, y si intentamos buscar algo en google no sale nada, con lo que parece que realiza como proxy, mostrando solo la web solicitada.
### web 5001
Realizacion de busqueda de directorios con gobuster
vm1-imagen2
nos indica que no tenemos acceso
### ssh 22
esta el servicio ssh con la version 8.9


## Investigacion/pruebas
se intenta aprovechar el proxy para realizar la consulta hacia las dos web y en la web del puerto 5001 aparece una web distinta, si miramos su codigo vemos que hay un mensaje.

vm1-imagen3

con lo que entendemos que hay 3 personas que tienen acceso a este server, Francisca y Paco, e indica que Paco tiene una contrasena debil.


### Fuerza bruta
realizamos un ataque de fuerza bruta por ssh al usuario ssh

vm-imagen4
vm-imagen5

investigando la maquina para ver metodos de y escalar a usuario de root, con lo miramos de intentar movernos al otro usuario que suponemos que es Francisca.

con el siguiente comando podemos ver todos los ficheros a los que tenemos permiso de lectura y/o ejecucion, con lo que lo usaremos en directorios especificos en el que sospechamos de alguna informacion relevante.

find /etc -type f -perm /u=r -exec ls -l {} \;

con lo que encontramos un fichero llamado id_rsa con lo que creemos que el la clave para acceder con el otro usuario y lo probamos.

al intentar hacer login vemos que nos pide la passphrase, con lo que con el jhon the reaper lo intentaremos desifrar


vm1-imagen6
vm1-imagen7


## Subida de prilegios

invesitagamos los permisos y grupos del usuario y vemos que pertence a un grupo de dbadmin y vemos a que permisos tiene este grupo con el siguiente comando

find / -type f -group 'dbadmin' -perm /g=x -exec ls -l {} \; 2>/dev/null

si revisamos el fichero del backupdb1 vemos que crea un directorio con el comando mkdir con lo que podemos crear un fichero mkdir con los permisos 777 que contenga /bin/bash y exportar el PATH de esta ubicacion. Ahora cuando intentemos ejecutar backupdb1 y ejecute el comando mkdir abrira un shell en root

vm-imagen8
vm-imagen9