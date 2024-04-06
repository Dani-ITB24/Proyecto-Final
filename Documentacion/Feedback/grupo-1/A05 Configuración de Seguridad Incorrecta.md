Preparación de maquina:
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/4e98bdcb-e2b0-4420-b8f7-3cd696bdc158)

Walkhtrough:
Vamos a scanear la IP en busca de servicios y sus vulnerabilidades...
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/651f83b2-30dc-452f-971e-7de00b3a02fe)
Descubrimos que hay una web (http), un ssh, y un vsftpd (sftp)

Vamos a visitar la web para analizar posibles pruebas.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/046bd205-2aa0-4703-b800-e6130f87a552)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/15a0028b-f044-4be5-a156-f62b31491c13)
Podemos observar que a parte de ser una web mal montada con un embed que no existe y de discord, tampoco tiene mucha información.

Haremos un DirBuster para comprobar si hay alguna información oculta en directorios que no se ven.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/dd699d8c-8135-4a01-953b-93e031122ab9)

Vemos que se listan la pagina de "css" que no habíamos visitado antes, tras visitarlo veremos esta nota:
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/61362ef0-0284-4556-8d86-892e6d92fc63)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/1dee8fc2-ff7c-47fc-aa1c-8c8472b7a527)

En la nota, veremos estas 2 pistas adicionales...
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/adc4cc77-0402-4af9-b818-999d8c063e86)

Al descargar la foto vamos a usar steghide para comprobar datos ocultos que pueda tener.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/4627a6b5-9846-4ac2-b8e0-67b24ed35091)
Al pedirnos una passphrase, vemos que va a requerir contraseña, lo guardaremos tal cual sin poner nada.

Vamos a extraer el hash con zip2john
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/d8fb028f-5be0-4035-b7a6-9f2086a74d02)
Ahora petamos el zip con john the ripper.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/02d8ad80-5707-4a19-ac5e-9278faa4e3ed)

Con el zip petado, al descomprimirlo y visualizar el .txt veremos un dato muy interesante sobre la web.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/a79b9565-67c3-4f07-9c6f-78f544be45b8)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/44fcb57e-0b64-470a-8f20-18e334e69819)
Como no tenemos ningunas credenciales y no parece haber más datos, buscaremos por otro sitio a ver que encontramos que nos pueda ayudar.

Cómo habíamos visto antes, existía un servidor de VSFPTD, vamos a visitarla cómo anon a ver que encontramos.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/9d1e1cb4-1385-4102-a909-57b726e1b086)
Terminamos encontrando un archivo de credenciales oculto dentro del ftp.

Las credenciales nos da un mensaje que parece base64.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/b6bd4956-0a7a-4a70-a668-0e81ff602261)

Transformamos de base64 a texto en plano y vemos que efectivamente son unas credenciales.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/e618425a-0e09-4131-b2b7-85afed67c695)

Ahora, usando las credenciales del archivo txt. Logueamos dentro del wcontrol
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/b5034e63-5d3c-4986-92af-3a34ab82d644)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/4d375451-dae0-45cb-ba38-b1d71c769e16)

Investigando la web, veremos una parte que parece interactuar con el sistema operativo.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/84086388-ddfd-48d5-82e6-6f0830d59b74)

Interceptando el paquete, vemos que efectivamente es un comando que se envia al sistema.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/0881b171-3928-408e-b79d-1082e70b7cf2)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/e376c5ea-55a1-438f-a96b-6f1a8b3b6d2f)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/4ee0cc00-e4e0-4d30-b036-a06acbeb4a2a)


Ahora con esto, haremos un clásico reverse shell por php.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/25bea4f5-0c2e-4c7a-9e67-d919f7f9ee0e)

Descargaremos el reverse shell desde el servidor a nuestra máquina con una web inicializada previamente...
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/f62f9ef2-cc8b-47a1-b2be-423aeee55bc6)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/b9d04868-56fd-4417-9d4f-21578674ecf7)

Entramos a la página, y ahora ya tenemos acceso!
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/36505e14-cad6-44ef-85f7-a012045d38a1)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/8a1c6c3d-4e5a-47a7-a638-d50983ec5ba0)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/0ddded51-c4d0-4e39-bb65-96f7f2aaef83)

Buscamos en la máquina por permisos especiales.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/66c687fa-4693-4347-8c55-2013bf1351e5)

Veremos un archivo llamado abejamaya, este no viene con el sistema.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/06d102d4-774d-40af-8eb0-f8bf2834516b)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/95b76be6-757d-4406-a830-f3ae60c97efd)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/b6c162c1-0c22-46c9-8d82-c1f3f81ac14d)

Como vemos, nos da una pista para ver en hexadecimal otro fichero del sistema.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/d7001ec7-d1de-4918-968d-ff51e03e1996)

Si seguimos la pista, vamos a convertir la linea que nos sugieren de base85 a texto en plano...
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/f06d6943-345b-4df6-809b-1f3597fc104f)

Con estas credenciales, podemos probar de entrar en alguno de los usuarios de la carpeta home.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/59c9055e-293b-4951-bef6-70bde71f54a0)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/584b87e3-c534-4586-a3fb-f062feb3d045)

Veremos un archivo en el home del usuario al que hemos logrado acceder.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/a58edbb5-2991-4ce4-9658-7e79abd0683e)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/a33129f1-89df-422a-99d5-8e764df196d8)

Con estos datos, podremos acceder mediante el SSH.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/cf87bf5e-867f-46dd-b992-03bf23b83ba6)
El problema siendo que nos piden una clave... Pero la vamos a petar con John otra vez. Lo que nos da que la contraseña es honeybee
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/bad5fa35-98ad-4a75-90e8-e8bf5ce84a11)

Al explorar la home de nuestro nuevo usuario, veremos un archivo con permisos especiales..
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/4d08e772-6579-4ba5-abf8-5e859cdd19a7)

Con GTFOBins encontraremos una forma para aprovecharnos de esto.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/13012f89-5084-4c2f-a8f0-db5ef79f168c)

Ahora que tenemos acceso root, visitaremos la clásica carpeta root.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/8d244d15-c60a-42b8-b713-eec42106507e)
Y aquí encontramos la flag de finalización!

