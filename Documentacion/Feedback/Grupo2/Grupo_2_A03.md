# WriteUp A03

Empezamos haciendo un nmap para descubrir los puertos abiertos. Vemos que tiene 2 puertos abiertos, uno es ssh por el puerto 22 y el otro es un apache por el purto 80.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_16-50.png)

Si entramos a la página web, nos encontramos con una página que nos dice que está en mantenimiento.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_16-51.png)

Hacemos un fuzzing para ver si encontramos algo aculto detras de la página. Encontramos el directorio farm.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_16-53.png)

Dentro de farm hay un login. Como no tenemos ningún usuario ni contraseña vamos a probar de hacer fuerza bruta.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_16-53_1.png)

Probamos con el usuario admin y las contraseñas de rockyou.txt. Vemos él en el status code nos da uno diferente la contraseña password. Así que vamos a probar con esa combinación.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-07.png)

Estamos dentro gracias al usuario admin y contraseña password.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-08.png)

Si exploramos la página veremos un apartado donde podremos subir imágenes, así que vamos a aprovechar para subir una shell. En mi caso voy a subir una shell que hace bypass a todas las restricciones de php por si acaso.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-09.png)

Al subir la shell no nos salta ningún error y además nos dice la ruta de donde se ha subido la shell.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-12.png)

Accedemos a la carpeta y ejecutamos la shell.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-12_1.png)

Ya somos www-data.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-13.png)

Investigando los directorios de apache vemos que había otra página oculta, así que vamos a probar de acceder desde el navegador de nuevo.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-14.png)

Vemos que es un login. Intentamos probar las mismas credenciales de antes, pero esta vez no funcionan.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-15.png)

Vamos a probar de hacer un SQLI.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-15_1.png)

Parece que sí que era vulnerable a SQLI. Como podemos ver nos dan 3 usuarios con sus respectivas contraseñas encriptadas. Vamos a probar con el primer usuario.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-17.png)

Desencriptamos la contraseña que estaba encriptada en base64.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-18.png)

Iniciamos sesión en el usuario pastorPaco. En su home hay un zip cifrado, así que vamos a pasárnoslo a la máquina atacante para poder desencriptarlo.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-21.png)

Nos descargamos el zip en la máquina atacante, sacamos el hash del zip con zip2john, crackeamos el hash con john y la wordlist rockyou.txt. Descomprimimos el zip con la contraseña que hemos descubierto.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-23.png)

Dentro del zip hay un archivo con lo que parecen las credenciales de otro usuario. Desciframos la contraseña que estaba en base64 e iniciamos sesión con las credenciales en el nuevo usuario granjero.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-24.png)

En la home del usuario encontramos la flag de user. Si hacemos un "id", podemos ver como el usuario está en el grupo sudo, así que solamente tenemos que hacer sudo su y ya somos root. Vamos a la carpeta root y encontramos la flag de root.

![](/Documentacion/Feedback/Grupo2/img_A03/2024-04-09_17-28.png)

## Conclusión

La máquina tiene una dificultad baja, ya que no hay nada que no hayamos hecho hasta ahora, pero cumple con el objetivo de ser vulnerable a inyección y tiene una buena ambientación con el tema de las granjas. Buen trabajo.