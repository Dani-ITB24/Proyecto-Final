## Lunes 19/02/2024

- Lectura del enunciado.
- Creación de un canal de comunicación con los compañeros de equipo.
- Entendimiento del enunciado.
- Entendimiento de las ramas en **GitHub**.
- Descarga de GitHub Desktop y aprender como se usa.

## Martes 20/02/2024

- Primera reunion formal con los compañeros
- Investigación de los CVE relacionados con nuestras vulnerabilidades asignadas del OWASP Top Ten
- Reparto de tareas a realizar con los compañeros de equipo
- Lluvia de ideas para la realización de la primera máquina
- Planificación de la primera máquina

## Miercoles 21/02/2024

- Lluvia de ideas para la realización de la segunda máquina.
- Planificación de la segunda máquina.
- Investigación de CVE extras para añadir a las máquinas.

## Jueves 22/02/2024

- Búsqueda exhaustiva de CVE para implementar en las máquinas.
- Investigación e intento de implementación del CVE-2023-22515.
- Instalación de servidor Confluence en máquina local para probar de implementar el CVE-2023-22515.
    -  Para poder implementar este CVE se tiene que instalar un servidor Confluence v8.0.0, pero se necesita un código de activación para el servidor Confluence que cuesta dinero, así que debido al coste monetario lo hemos dejado de lado.


## Viernes 23/02/2024

- Planificación y reparto de las tareas de la primera máquina
- Investigación de cómo hacer movimiento lateral en la primera máquina
- Creación de diferentes máquinas virtuales en local para probar formas de hacer movimiento lateral
    - He estado investigando, y una de las formas para hacer movimiento lateral en ubuntu server es mediante ssh, así que he intentado configurar el ssh de una máquina ubuntu server simulando la ctf y poder hacer movimiento lateral en ella, pero no lo he logrado.

## Lunes 26/02/2024

- Continuación de la investigación de cómo hacer movimiento lateral en la primera máquina.
    - Hoy he seguido intentando configurar el ssh de tal forma que me deje hacer el movimiento lateral, y lo he conseguido.
- Intento de explotar la CVE-2023-22809 para escalar privilegios en una máquina local.
    - He intentado utilizar el CVE-2023-22809 en una máquina local ubuntu server para escalar privilegios, pero no lo he logrado. De momento lo dejo de lado y lo miraré más adelante cuando la ctf ya tenga más forma.

## Martes 27/02/2024

- Debido a la amenaza hecha sobre la forma de redactar los reportes, me he visto en la obligación de cambiar la forma en la que redacto mi reporte diario, dando más datos sobre lo que voy haciendo.
- Documentación sobre la configuración del servicio ssh en el documento de la máquina uno.
    - He añadido a la documentación de la máquina uno como vamos a configurar el ssh de la primera máquina para poder conseguir el movimiento lateral entre usuarios.
- Creación de un logo para la página web de la máquina uno.

## Miercoles 28/02/2024

- Investigación de formas de escalar privilegios en la primera máquina.
    - He estado investigando diferentes formas de poder escalar privilegios en una máquina ubuntu server.
- Avances en la página web.
    - Hemos estado avanzando y mejorando la página web para que tenga productos y diferentes secciones.

## Jueves 29/02/2024

- Primera revision presencial.
- Cambiar el archivo .md de Genis.

## Viernes 01/03/2024

- Investigación sobre nuevas forma de hacer movimiento lateral y escalada de privilegios
    - Debido a los comentarios de ayer sobre que no les gusta a los evaluadores la forma en la que hacemos movimiento lateral entre usuarios y escalamos privilegios, he estado investigando formas más complejas de hacer el movimiento lateral y la escalada de privilegios. La semana que viene probaremos de implementarlos.

## Lunes 04/03/2024

- Intento de implementación de la escalada de privilegios
    - He estado intentando entender e implementar una nueva escalada de privilegios en una máquina local para la máquina uno.

## Martes 05/03/2024

- Creación de un binario para lograr un nuevo movimiento lateral
    - Hemos creado un binario que tendrá SUID y contendrá pistas para poder hacer movimiento lateral

![](/ReportesDiarios/Joan/img/2024-03-05_18-54.png)

- Creación de una imagen para poder hacer el movimiento lateral
    - Dentro de la imagen estará el contenido al que se hace referencia en el archivo mencionado anteriormente

![](/ReportesDiarios/Joan/img/bee.jpg)

## Miercoles 06/03/2024

- Creación de la primera máquina.
    - He estado ayudando a crear la primera máquina. Hemos juntando todas las partes que hemos estado configurando y creando hasta la fecha, verificando que todo funcione correctamente.

## Jueves 07/03/2024

- Instalación de la imagen y creación del walkthrough
    - Hoy he descargado la imagen de la primera máquina del docker hub del Jordi y me ha empezado a dar errores el docker, pero los he podido solucionar y he empezado a hacer capturas de los pasos a seguir para solucionar la primera máquina y añadiendo las capturas a la documentación de la máquina uno.

![](/ReportesDiarios/Joan/img/2024-03-07_18-15.png)

## Viernes 08/04/2024

- Continuación de la creación del walkthrough
    - Hoy he seguido haciendo el walkthrough haciendo capturas de los pasos a seguir y añadiéndolas a la documentación de la máquina uno.

## Lunes 11/03/2024

- Finalización de la documentación del walkthrough de la primera máquina.
    - Hemos acabado el walkthrough de la primera máquina con todas las capturas comentadas
- Creación CVE-2023-22809
    - Hemos instalado el servidor PaperCut versión 18 para que sea vulnerable al CVE-2023-22809

## Martes 12/03/2024
- Compartición de la segunda máquina en Docker Hub
    - Jordi ha creado la segunda máquina y nos la ha compartido por docker hub y ahora podemos modificar los 3 la máquina y subir los cambios.
![](/ReportesDiarios/Joan/img/docker.png)

- Instalación PaperCut en el docker
    - Hemos instalado PaperCut 18.3 en el docker.
![](/ReportesDiarios/Joan/img/paper.png)

- Instalacioón de CUPS
    - Hemos intentado compartir las impresoras de CUPS con el servidor PaperCup pero no hemos sido capaces.
![](/ReportesDiarios/Joan/img/cups.png)

## Miercoles 13/03/2024

- Instalación de SAMBA
    - Hemos instalado y configurado SAMBA para que tenga recursos compartidos para un solo usuario.

- Configuración de los puertos de los servicios para que solo se vean en local host
    - Hemos hecho que algunos servicios solo sean accesibles desde localhost y para ello hemos utilizado la herramienta chisel