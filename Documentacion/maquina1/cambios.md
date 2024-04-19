## Simplificar inicio CTF

Hemos hecho que el inicio de la ctf ya no sea tan rebuscado como antes. Ahora simplemente haciendo un fuzzing encontraremos una carpeta backup y desde ahí ya podremos seguir.

![](/Assets/cambios/2024-04-19_17-49.png)

Dentro encontraremos un backup.zip donde tendrá todo el contenido necesario.

![](/Assets/cambios/2024-04-19_17-49_1.png)

![](/Assets/cambios/2024-04-19_17-51.png)

## Cambio imagen

Hemos cambiado la imagen.

![](/Assets/cambios/2024-04-19_17-51_1.png)

## Corrección logo página

Ahora el logo de la página web ya funciona.

![](/Assets/cambios/2024-04-19_17-52_1.png)

## Eliminar bash_history

Hemos redirigido el bash_history de los dos usuarios para que no quede registro de los comandos ejecutados anteriormente.

![](/Assets/cambios/2024-04-19_17-48_1.png)

## CVE implementado

Hemos implementado el CVE-2024-1086. De esta forma hay dos caminos para poder escalar privilegios.