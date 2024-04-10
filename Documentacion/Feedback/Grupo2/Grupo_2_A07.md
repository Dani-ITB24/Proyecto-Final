# WriteUp A07

Empezamos haciendo un nmap para descubrir los puertos abiertos. Vemos que tiene 2 puertos abiertos, uno es ssh por el puerto 22 y el otro es un apache por el purto 80.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-42.png)

Si entramos a la página web, nos encontramos con una página que nos dice que está en mantenimiento.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-43.png)

Hacemos un fuzzing para ver si encontramos algo aculto detras de la página. Encontramos el directorio accountlogin.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-43_1.png)

Dentro de accountlogin hay un login de usuario y admin. Vamos a entrar al de admin.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-44.png)

Como no tenemos ningún usuario ni contraseña vamos a buscar por internet a ver si hay algún tipo de exploit para este login.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-55.png)

Encontramos el CVE-2024-29410, que nos da el usuario "mayuri.infospace@gmail.com" y contraseña "admin" del login admin.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-54.png)

Iniciamos sesión con las credenciales.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-55_1.png)

Ya estamos dentro del panel de administración. Ahora vamos a investigar.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-55_2.png)

En el apartado "Add Expense Category Details" capturamos la petición y probamos de hacer un sqli con sqlmap.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_16-58.png)

Utilizamos sqlmap.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-01.png)

Hemos sacado 17 tablas, pero la que más nos interesa es la de admin, así que vamos a dumpear la tabla.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-04.png)

Dumpeamos la tabla admin.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-05.png)

Sacamos 2 nuevos usuarios, pedro y andrea, con sus respectivos hashes, así vamos a ver si podemos sacar las contraseñas.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-05_1.png)

Vemos que el hash de pedro es pedro007 y probamos de iniciar sesión por ssh, pero las credenciales no funcionan por ssh, así que vamos a hacer fuerza bruta. Gracia a la fuerza bruta, logramos encontrar la contraseña de pedro para iniciar sesión por ssh.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-14_1.png)

Dentro del usuario pedro encontramos la flag de user.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-12.png)

Vemos que también hay un script en bash que ejecuta el comando data. Este script parece un script que se ejecuta automáticamente con cron, así que vamos a cambiar el script por una reverse shell.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-17.png)

Nos ponemos en escucha y recibimos la reverse shell como admin. Una vez ya somos root, ya podemos ver la flag de root.

![](/Documentacion/Feedback/Grupo2/img_A07/2024-04-10_17-24.png)