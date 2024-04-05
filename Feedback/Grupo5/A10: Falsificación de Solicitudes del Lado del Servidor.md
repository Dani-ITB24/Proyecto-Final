# Explotación de la maquina

Primero de todo hacemos un escaneo de puertos con nmap para ver que servicios estan abiertos.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/b9203e95-4dbe-4fac-b977-69f0f9a9fdba)


Vemos la web principal.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/e77cf28d-04ff-49eb-bb77-6cefe28bd37f)

En el escaneo de puertos hemos visto que habia un puerto 5000 que tenia otra web.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/c1b9da0d-123a-4c7c-befc-ec5f86259cc8)

Hacemos un gobuster de la web principal.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/6de1e7c0-abaa-446c-be28-456959380e27)

El admin es un login 

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/098a1f90-6567-4d32-9884-17f907a7dfee)

Y l,p,k tiene un fichero .txt que dice esto.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/ee78d258-38bf-444b-a3d8-5003f0a259eb)

En la pagina principal he buscado si se puede hacer sql inclusion o ssrf , y he encontrado una web que me a ayudado a poder sacar el archivo /etc/passwd. Visualizando el usuario paco y francisca.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/da1d4528-668b-4c7d-ba54-891d13254d08)

No he encontrado nada mas, a si que intentare hacer un hydra de cada usuario a ver si alguno de los dos tiene una contraseña vulnerable.

Parece que paco si tiene contraseña vulnerable.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/e3774a22-7cea-4cc7-ad49-7220c89087cd)

Francisca de momento no esta encontrando nada, a si que vamos a intentar entrar como paco a ver que podemos hacer.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/36081f25-f7e8-4b23-9ff5-a9d731d5fb64)

Encontramos la flag del usuario.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/d8d8da70-8617-4d94-8e7c-a6acc87ec64a)

He buscado si paco tenia algun permiso como administrador y no es el caso, a si que supongo que francisca tiene que tener algo mas de privilegios que paco. Desde paco lo unico que se me ocurrio es buscar alguna pista o diractamente las claves de francisca. 

He entrado dentro del direcorio de sshkey, y he visto como propietario el grupo dbadmin que dentro esta francisca.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/d0f0371f-e5b6-4496-822a-61a5a48740fe)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/ebe01e89-692d-436d-ac3d-aff8f88c11c4)

Vamos a sacar este fichero a la maquina principal para hacerle un jhon y con suerte descubir alguna contraseña.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/8edc5dfc-74b2-4529-96d5-740cb4da8df5)

Utilizamos ssh2john.py y john para sacar la contraseña de dendo de la clave privada.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/795c4d5b-d7d1-4795-a826-8786d1f522b8)

Entramos con francisca

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/e6c98979-c19f-4a20-973d-36eca675905a)

Investigando un poco, vemos que podemos ejecutar como root backupdb1.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/33febda3-cafe-4bf8-8b82-8d489e4b8dd6)

Este archivo lee un archivo llamado head.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/4d6333a4-76c1-4001-8e24-d7d1b8977c37)

Vamos a crear un archivo llamado head en el directorio francisca ya que hay tenemos privilegios. Dentro ponemos codigo bash para iniciar como root ya que el archivo backupdb1 se ejecuta como root.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/7c30367a-a077-4253-b046-ab66eb3e375c)

Iniciamos desde el directorio francisca el backupdb1 y probamos si funciona. Pero no funciona.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/cbbf62e6-b0eb-4a69-bb2e-3dfa889ddad4)

Damos permisos 777 al fichero head y volvemosa probar, esta vez si funciona.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/d2cf0469-17ec-4f3d-8271-31ddea6d8d94)

Una vez en root vamosa su directorio y buscamos la flag. Parece estar escondida. He hecho un cat del bash_history a ver si encontraba alguna pista, y parece estar ya aqui.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/41e9a3c3-156b-48fd-af1e-4398293d1aea)

# Feedback

La maquina esta bien hecha, he encontrado alguna forma diferente para visualizar como www-data desde la web, pero por lo otro esta bastante bien, es rebuscada y tienes que pensar bien en el movimiento lateral.
