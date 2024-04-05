# WriteUp segunda máquina

Empezamos haciendo un nmap para descubrir los puertos abiertos. Vemos que tiene 3 puertos abiertos, un ssh por el puerto 22, un http por el puerto 80 y otro http por el puerto 5000.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-04_18-08.png)

Si accedemos al puerto 80 por el navegador podemos ver que es un validador de URLs. De momento vamos a seguir investigando.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-04_18-10.png)

Vamos a hacer fuzzing para ver si encontramos algo interesante. Encontramos diferentes carpetas y un info.php con error 500. Primero vamos a mirar las carpetas.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-06.png)

En la carpeta admin vemos un login, pero vemos que lo que escribimos se ve reflejado en la URL, eso quiere decir que se está utilizando GET en vez de POST.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-17.png)

Si miramos el código fuente de la página, vemos que es un simple html y no envía la información a ningún lugar, así vamos a dejar esto de lado, ya que no nos lleva a ningún lugar.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-17_1.png)

Las carpetas k, l y p son simplemente un rabbit thole que nos hacen perder el tiempo

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-20.png)

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-20_1.png)

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-20_2.png)

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-20_3.png)

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-21.png)

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-21_1.png)

Cuando entramos en el archivo info.php nos deja entrar, pero no nos muestra ningún tipo de información.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-22.png)

Si miramos el código fuente tampoco encontramos nada.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-22_1.png)

Hacemos un fuzzing al puerto 5000, pero no encuentra nada. Entramos en el puerto 5000, para ver si hay algo interesante. Vemos que nos sale un mensaje de Acceso Prohibido.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-04_18-10_1.png)

En el código fuente no se ve nada raro.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-23.png)

Como hasta ahora no encontramos nada interesante, vamos a volver a la página de validación de URLs y vamos a poner una URL para ver que es lo que hace.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-24.png)

Vemos que nos muestra la página del enlace, pero desde el archivo. Como que el archivo hace la petición por nosotros.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-24_1.png)

Vamos a aprovechar esto y vamos a poner la página del puerto 5000 y ver si nos da un nuevo resultado.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-25.png)

Ya no nos sale el mensaje de Acceso prohibido, ahora dice que la página está en desarrollo.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-25_1.png)

Si miramos el código fuente vemos que hay un mensaje diciendo que la contraseña de Paco es muy débil, así que vamos a comprobarlo.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-26.png)

El mensaje estaba en lo cierto. Haciendo fuerza bruta con hydra somos capaces de encontrar la contraseña de paco.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-37.png)

Iniciamos sesión con paco y ya tenemos la flag de user.txt.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-38.png)

Buscamos archivos con permisos SUID y vemos que existe un binario con SUID que se llama backup1.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-40.png)

Si lo intentamos ejecutar no podemos.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_17-28.png)

Vamos a pasar linpeas a la máquina víctima para buscar formas de hacer movimiento lateral o escalda de privilegios.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-50.png)

Nos descargamos linpeas, le damos permisos de ejecución y lo ejecutamos.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-51.png)

Linpeas ha encontrado una llave privada ssh que podemos usar para iniciar como otro usuario.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-53.png)

Si miramos los usuarios que ha listado linpeas, solo podemos probar con francisca.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-54.png)

Nos pasamos la llave a la máquina atacante.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_16-57.png)

Nos descargamos la llave. Utilizamos ssh2john para sacarle el hash y crackearlo con john. La contraseña es laracroft.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_17-07.png)

Cambiamos los permisos de la llave y iniciamos sesión por ssh con el usuario francisca.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_17-08_1.png)

Ahora sí que podemos ejecutar el binario. Al ejecutarlo nos pide un nombre, se lo damos, y después dice que muestra las primeras líneas del archivo, así que lo más seguro es que esté utilizando head.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_17-31.png)

Para escalar privilegios vamos a cambiar el path de ejecución para que busque primero en el directorio donde nos encontramos y crearemos un archivo que se llamara head con un el comando bash para que se ejecute una shell como root. Una vez ejecutamos el binario ya somos root y podemos encontrar la flag de root escondida en el .bash_history.

![](/Documentacion/Feedback/Grupo5/img_A10/2024-04-05_17-37.png)