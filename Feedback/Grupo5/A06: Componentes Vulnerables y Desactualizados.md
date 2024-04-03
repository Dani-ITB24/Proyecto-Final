# Explotación de la maquina

Lo primero de todo hacemos un escaneo de puertos de la maquina para ver que servicios estan activados.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/0ff31222-6fb0-49ab-97b0-5dae84970aab)

Vemos que tiene una web que es un login.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/d95749eb-70a5-4539-bba0-6278ad27361d)

Hacermos un dirbuster para ver si tiene algun directorio oculto pero no vemnos que tenga nada.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/8456c465-34e1-4642-8701-a67f2cd119ae)

Vemos las diferentes versiones de los servicios, la version del apache es antigua y mirando por inetrnet he encontrado la siguiente cve con el tomcat.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/1a453b12-f4ba-4274-b645-5907f4464b25)

Copiamos el script de python.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/5be39604-5631-48b1-8f8e-8103491dade7)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/491c39d4-48f0-4a02-94b5-e7768769ce58)

En la misma web nos dicen que hagamos lo siguiente.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/4c0f415a-ef65-4383-9d16-fff7f4bafd07)

Lo hacemos y vemos que tenemos un usuario y contraseña cifrada en base64. 

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/9274e0e3-f28a-4390-ad7b-e2c6c54eeed9)

Descodificamos la contraseña.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/dce5881e-1a4f-4d1b-bcca-04d52683e18a)


Intentamos entrar por ssh, y vemos que hemos podido y encontrado una flag en el mismo directorio de este usuario.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/e3b4e134-c0bf-472c-ab65-112f93f447b6)

Una vez en este usuario, vamosa ver si podemos ejecutar algo como sudo.
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/730a5bc3-dd26-4016-8dec-3aff8efefc02)

Vemos que tenemos vim, buscamos en GTFOBins para ver si funciona.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/e50fdde8-f4a7-427f-9d2b-91dfe66cb2b2)

Probamos y vemos que estamos ya como root.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/95a32830-41e7-4b97-987e-14acf3c486b4)

La flag root no esta en su directorio de usuario, a si que he hecho un find para ver si esta en otro lado, y la he encontrado hacemos un cat y vemos el contenido.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/a8fa4d2a-27eb-476d-b699-87f1b9d1a1a3)



# Feedback

El principio de la maquina, hay que descubir bien que es lo que podemos utilizar para entrar, o podemos aprovechar para seguir avanzando, pero una vez con el usuario se facilitan las cosas.


