## Walkthrough
### Exploracion web
con el gobuster realizamos un escaner de los directirores porque vemos que al acceder via web no hay nada solo el fichero por defecto del apache2

![img1](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/e1dc60c5-3dc4-41b1-82c8-d2593c0e99a6)

al acceder via web vemos que hay ficheros, con lo que descargamos y los analizamos
![img2](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/929e0369-23eb-469c-b24e-2788a7014b25)

### desencriptacion de ficheros

vemos que todos menos un fichero tiene la extension .gpg que quiere decir que esta encriptado, con lo que intentaremos hacer fuerza bruta a los fichero.

![img3](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/0b60598a-caef-4fcb-8933-09d1404caca0)

![img4](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/f5210518-3eec-43f3-8c92-27508f37415c)

![img5](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/621223ae-d91e-4222-8005-990a63be15e3)

despues de realizarlo a todos los ficheros, vemos que hay un fichero que  contiene texto formato binario con lo que usamo cyberchef.

![img6](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/14b1ea18-5cf9-4a61-a50b-484cc13be92c)


con esta palabra con conectamos por ssh al usuario de john y al acceder vemos varios ficheros.

![img7](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/1f7e1e0a-0944-4dbb-b55b-32dba4758b05)


### Root
si leemos el ficher readme.txt, nos indica que para acceder a root debemos ejecutar desafio, con lo que si lo hacemos nos indica que hemos de idicar que palabra el el hash que nos muestra.

![img8](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/693f74d3-a4d6-4ed3-a8be-cecd9ec6caf6)

si lo resolvemos nos indica una posible contrasenya


![img9](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/f07d60d1-ea07-4fce-9313-f0ccbb3a8692)


lo probamos con el usuario root por ssh y funciona

![img10](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/e5f7b0e0-8a84-4374-893b-6f50549c1d79)


ahora vemos que hay un fichero oculto, si le hacemos un cat vemos la flag

![img11](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/f93b6216-2199-41c2-a9b4-81a734cee7a0)
