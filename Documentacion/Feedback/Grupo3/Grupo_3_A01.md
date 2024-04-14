# WriteUp A01

Iniciamos la CTF con docker compose.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-12_16-41.png)

Miramos que ip tiene la máquina.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-12_16-42.png)

Hacemos un escaneo de puertos con nmap.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-12_16-48.png)

Accedemos a la página web por el puerto 8080.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-30.png)

Exploramos la página y vemos que hay más páginas.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-31.png)

Descubrimos la dirección 172.18.0.4.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-31_1.png)

Accedemos a la direccón ip, que nos lleva a otra página.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-32.png)

Encontramos un login, pero no tenemos credenciales, así que probamos de darle a recuperar contraseña.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-32_1.png)

Los inventamos las credenciales.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-33.png)

Ahora tenemos acceso a un command panel, así que vamos a hacer una reverse shell.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-36.png)

Buscamos binarios con SUID y encontramos python3.9.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-43.png)

Con GTFOBins ya podemos encontrar el comando para escalar privilegios. Ya somos root.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-48.png)

Investigando, encontramos las credenciales de una base de datos.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-49.png)

Iniciamos sesión en la base de datos y le cambiamos la contraseña al único usuario que hay.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-53.png)

Iniciamos sesión.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-55.png)

Ya tenemos acceso a la página web como un usuario autorizado.

![](/Documentacion/Feedback/Grupo3/img_A01/2024-04-14_19-55_1.png)

## Conclusión

La máquina ha sido demasiado sencilla y corta, simplemente se hace una reverse shell y una escalada con SUID. La máquina no tiene ninguna flag de user o root y el montaje de la máquina con docker compose ha sido bastante complicado para nosotros que nunca hemos tocado docker compose. La máquina cumple con su propósito, pero deja mucho que desear.