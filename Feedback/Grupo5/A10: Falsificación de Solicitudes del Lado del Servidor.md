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

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/9ff567da-4788-48a9-95f2-f496e66d5060)



# Feedback

