Hago un scaneo de puertos y listo los servicios corriendo en cada uno con sus respectivas versiones:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/834e71ad-5d37-4308-a528-d66a0948d06e)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/d7583465-da58-462f-9b85-61b4d6599c33)

Web orientada en The Originals, en la web salen una serie de nombres de personajes, posibles usuarios del sistema.

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/0ace78b8-f4a8-4f9d-a7a6-4b0cc0719fd5)

Haciendo fuzzing a la web sacamos los siguientes directorios ocultos, en los que no encuentro nada:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/6786b55a-0efd-4c74-adf6-1201446d1c85)

La versión de SSH es vulnerable a User Enumeration, por lo que miro a ver si alguno de los personajes es un usuario del sistema:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/38b3f3dd-b28e-4021-9a27-e6c5d1dc6895)

Encuentra el usuario "elijah":

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/6f13d347-6561-4a30-b1e8-e032e06f45fa)

Intento hacer fuerza bruta con Hydra y consigo acceso al servidor FTP con este usuario:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/db0a4c9a-a53b-4731-841a-11ff18e93d21)


![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/79e63756-b8f1-4dff-8810-4ba933e9056d)

Preuebo a subir un php que actuará como terminal para ver si puedo ejecutar comandos, y en efecto lo consigo:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/c1e1c1fd-6452-454a-b0b8-934b59fd41fe)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/e9efc87a-162d-4892-8d28-e69fc3578c4e)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/c0d0046a-b86c-4bc4-b8da-a4bbbbc443ba)

Subo una reverse shell, le doy permisos de ejecución y pongo el puerto en escucha para conectarme: 

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/053fb3dc-ffbb-4437-b5e8-1568451e39c4)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/78d63ad7-a96a-4e2f-9bde-ba47703d3a58)

Al acceder veo una imágen así que la descargo para analizarla:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/7032bf05-d0fb-474c-ad37-a4d3d3a4d6b4)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/b90da682-e103-4125-b07c-c21922424fcb)

Y la examino con "binwalk":

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/e9975880-53ee-48ca-8487-2188cdbdf418)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/ae580e42-3f2e-4ccb-8130-4be43304fb5d)

Hay archivos ocultos, un zip con contraseña que consigo crackear, y dentro de este un archivo .txt con una lista de contraseñas:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/c431a978-a6f6-414c-8140-716a572ff139)

Hago fuerza bruta vía SSH al usuario caroline y consigo la contraseña:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/79a892d0-ca51-4a4e-8318-9cd3043fc5e1)

Accedo vía SSH:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/7f062adc-af33-4fe3-9e56-7262a8d43475)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/4adb01be-285f-4bca-86b3-ce5a3ca84cec)

Veo que puedo ejecutar como root python3.10:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/858d7942-82a7-47f0-b223-7b6372277066)

Modifico el script para que me abra una shell, y lo ejecuto como root. Finalmente ya soy root y puedo ver la flag root.txt:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/7565dc54-b59e-431e-9831-31145d656a98)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/c3076365-e372-4d60-984b-62f45eaf4347)
