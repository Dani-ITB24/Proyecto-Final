# Reporte 19 de febrero de 2024


- Aprender como funciona *GitHub*.
- Creación de una branch sobre la que trabajar.
- Organización de la branch con subdirectorios.
- Pruebas necesarias para un uso correcto.
- Recolectar información sobre las vulnerabilidades asignadas.
    - A05:2021 - Configuración de Seguridad Incorrecta.
    - A09:2021 - Fallas en el Registro y Monitoreo.
- Creación del documento principal para el proyecto.


# Reporte 20 de febrero de 2024

- Ampliación de la información en el documento [TrabajoFinal.md](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo1(Jordi-JoanMaria-Genis)/Documentacion/TrabajoFinal.md).
    - Buscar información de las vulnerabilidades asignadas del OWASP Top 10.
- Crecion de subdirecrios para la organizacion de las maquinas.
	- Tambien hemos creado los documnteos que van a contener la informacion basica de cada maquina. 
- Investigacion profunda de las vulnerabilidades asignadas y de los CVEs de 2023 para una correcta implementacion.
- Planificacion y diseño de la primera maquina, así como los servicios que van a correr en ella.


# Reporte 21 de febrero de 2024

- Creación de las imágenes descriptivas de cada máquina
- Planificacion y diseño de la segunda máquina, así como los servicios que van a correr en ella.
- Búsqueda intensiva de CV de 2023 para aumentar la dificultad de la máquina

# Reporte 22 de febrero de 2024

- Creación de gráficos para una mejor comprensión de las máquinas
- Asentar las bases de docker y empezar a crear las primeras imágenes
- Creación del diseño de la página web para la primera máquina.

# Reporte 23 de febrero de 2024

- Diseño y creacion de la primera maquina
    - El servidor ftp ya esta configurado y corriendo en un docker, asi que se da por terminado
    - La pagina web avanza muy bien, ya que hemos dividio muy bien las taras.
        - Gestion de sesiones en php
        - Cracion de la paginas del panel de control 


# Reporte 26 de febrero de 2024

- Creacion de la primera maquina
    - Diseño y crecion de la pagina web


# Reporte 27 de febrero de 2024

- Documentar la primera maquina
- Crear una imagen con un zip con steghide
- Mejorar la pagina web


# Reporte 28 de febrero de 2024

- Documentar la primera maquina
- He heco pruebas con docker y he buscado como compartir dockers con dockerhub


# Reporte 04 de marzo de 2024
*Como el viernes no pude hacer nada, hoy le he dedicado más horas.*

- He rediseñado la parte inicial de la maquina 1, en lugar de dar pistas en el robots.txt lo hacemos en un comentario.
![](/ReportesDiarios/Jordi/img/comentariocss.jpg)

- He terminado el panel de control de la página web:
![](/ReportesDiarios/Jordi/img/config.jpg)

- Todos las opciones dirigen a esta página.
    - En la que no existe una contraseña correcta, es solo un rabbit hole
![](/ReportesDiarios/Jordi/img/password.jpg)


- Menos la página de Apache2 status que lleva aquí:
    - Que es donde tienes que modificar con BurpSuite y conseguir la reverse shell.
![](/ReportesDiarios/Jordi/img/statusapache.jpg)


- Tambien he hecho pruebas con DockerHub y he creado una primera versión de la ctf.
![](/ReportesDiarios/Jordi/img/dockerhubcli.png)
![](/ReportesDiarios/Jordi/img/dockerhubweb.png)


# Reporte 05 de marzo de 2024

- He complicado un poco la maquina, cifrando las credenciales que hay en el servidor ftp.
- He editado el hexadecimal de una imagen, para almacenar ahi unas credenciales.

![](/ReportesDiarios/Jordi/img/hexeditor.jpg)

# Reporte 06 de marzo de 2024

He crado una imagen para tener mas claro el movimiento dentro de la maquina.

![](/ReportesDiarios/Jordi/img/movimiento.gif)

- He avanzado mucho en el docker, completando el movimiento lateral
- Hemos tenido un problema y es que no podiamos hacer la revrse shell via command inyection y lo que hemos hecho es buscar una alternativa, y lo que hacemos es subir una revrse shell en php.

# Reporte 07 de marzo de 2024

- Maquina 1 terminada y subida en docker hub.

# Reporte 11 de marzo de 2024

- Finalizacion de la docuentacion de la maquina 1.

- Hemos encontrado un CVE para la maquina 2 y lo hemos probado. (CVE-2023-22809)

![](/Assets/papercut.jpg)


# Reporte 12 de marzo de 2024

- Creacion de un repositorio compartido con los compañeros.

![](/ReportesDiarios/Jordi/img/repo.jpg)

- Cracion del docker de la maquina2 y instalcion de todos los servicios necesarios (apache,mysql,php,telnet)

- Tambien hemos instalado el papercut, que es el software vulnerable al cve, y hemos intentado añadir una impersora virtual con cups, pero despues de muchos problemas hemos buscado otro metodo para proporcionar las credenciales.


# Reporte 13 de marzo de 2024

- Hemos añadido las credenciales del primer usuario a la pagina web.

![](/ReportesDiarios/Jordi/img/credsthegrafg.jpg)

- Instalacion de samba y configuracion para que solo escuche connexiones internas.

![](/ReportesDiarios/Jordi/img/smbconf1.jpg)

- Configruacion del recurso compartido

![](/ReportesDiarios/Jordi/img/smbconf2.jpg)

- Hemos configurado el port forearding con chisel para comprobar su funionamiento

![](/ReportesDiarios/Jordi/img/chiselsrv.jpg)
![](/ReportesDiarios/Jordi/img/chiselclient.jpg)

- Tambien hemos hecha furezabruta a un usuaio de smb con metasploit.

![](/ReportesDiarios/Jordi/img/msfsmbbrute.jpg)

- Hemos montado el recurso compartido en la mquina para tener acceso a el

![](/ReportesDiarios/Jordi/img/mount.jpg)


# Reporte 14 de marzo de 2024

- Correciones de la mquina uno
    - Elimiar nuestros nombre y habilitar los servicios

- Busqueda de movimientos laterales para la maquina 2.


# Reporte 15 de marzo de 2024

- Traduccion.

- Busqueda de ideas para movimiento lateral.


# Reporte 18 de marzo de 2024

- Hemos intentado implemantar movimeinto lateral por medio de un script en python, jugando con las librerias.


# Reporte 19 de marzo de 2024

- Hemos acabado el moviemnto lateral y hemos empezado a investigar el movimiento vertical.


# Reporte 20 de marzo de 2024

- Hemos intentado implemantar movimeinto vertical con tareas de cron.

![](/ReportesDiarios/Jordi/img/ml1.png)
![](/ReportesDiarios/Jordi/img/mv2.png)
![](/ReportesDiarios/Jordi/img/mv3.png)

- Al final no ha funcionado.


# Reporte 21 de marzo de 2024

- Hemos terminado la escalada de privilegios con tares de cron
- Inicio documentacion maquina2.


# Reporte 22-27 de marzo de 2024

- He terminado la documentacion de la creacion de la mauqina2, y he tenido problemas para iniciar los servicios automaticamente, estoy investigando


# Reporte 2 de Abril de 2024

- He terminado de configurar el Docker para que se inicien los servicios solos y he terminado el WriteUp de la máquina tu1millon del grupo5 con la vulnerabilidad A06.


# Reporte 3 de Abril de 2024

- He empezado ha resolver la mauqina A04 del grupo 4.