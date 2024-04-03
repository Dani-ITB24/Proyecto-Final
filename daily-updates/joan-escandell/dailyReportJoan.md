# 22/02/2024:

- [x] Familiarización con GitHub
- [x] Conocer funcionamiento superficial y un poco de práctica sobre Docker
- [x] Búsqueda de CVEs de 2023 en adelante que puedan adaptarse a nuestra CTF.

# 26/02/2024:

- [x] Instalación de Docker y entornos
- [x] Práctica de funcionamiento de docker y componentes.
- [x] Búsqueda de CVEs extras

# 27/02/2024:

- [x] Configurar Docker en ubuntu server e instalacíon de apache2, mariaDB, y otros servicios para comprobar su funcionamiento. 
- [x] Práctica de funcionamiento de docker y servicios.
- [x] Elaboración capturas del proceso de instalación de Docker y contenedor.
- [x] Intento de configuración de red del contenedor para poder conectar diferentes máquinas. (Fallido)

# 28/02/2024:
 
- [x] Configuración de apache2 y sitio web.
- [x] Configuración de base de datos MariaDB.
- [x] Instalación PHP.
- [x] Configuración de red de contendor de Docker.
- [x] Capturas del proceso de configuración del contenedor para la documentación.
- [x] Configuración formulario de login y portal de la web.
- [x] Configuración de usuario para realizar movimiento lateral.

# 01/03/2024:
 
- [x] Configuración de apache2 y sitio web.
- [x] Creación y adaptación formulario vulnerable SQLi 
- [x] Creación usuario/grupos de sistema y distintos permisos.
- [x] Capturas del proceso de configuración para la documentación.
- [x] Configuración formulario de login y portal de la web.
- [x] Configuración de usuario para realizar movimiento lateral.
- [x] Pruebas de ataque con Hydra a formulario web.
- [x] Pruebas de ataque con SQLmap a formulario con la ayuda de BurpSuite.
- [x] Terminar en términos generales el CTF a falta de últimos detalles.

# 04/03/2024:
 
- [x] Realización de capturas del proceso de ataque a la máquina para la explicación del walkthrough.
- [x] Configuración de SSH para la conexión y escalada de privilegios en el contenedor Docker.
- [x] Configuración de red de contendor de Docker.
- [x] Configuración formulario de login y portal de la web.
- [x] Configuración de ficheros "logs.txt" para ambos formularios de la web.
- [x] Pruebas de ataque de fuerza bruta con BurpSuite Intruder.
- [x] Pruebas de "push" para subir Docker Images a GitHub.

# 05/03/2024:
 
- [x] Ubicar y configurar directorios para las flags user.txt y root.txt
- [x] Configuración de ZIP con contraseña para explotar con fuerza bruta.
- [x] Buscar posibles CVE que se pudieran implementar.
- [x] Tomar capturas y subirlas a GitHub para el Walkthrough.
- [x] Solucionar problemas con puertos de Docker y la máquina Ubuntu Server
- [x] Pruebas de "push" para subir Docker Images a GitHub.

# 06/03/2024:
 
- [x] Configurar y probar logs para todos los servicios.
- [x] Configurar fichero de logs y ruta para Apache2.
- [x] Configurar fichero de logs y ruta para SSH (de momento no conseguimos configurarlo).
- [x] Configurar fichero de logs y ruta para MySQL.
- [x] Prueba y error de todos los sistemas de logs.

# 07/03/2024:
 
- [x] Configuración de ficheros de logs de apache2.
- [x] Configuración de ficheros de logs de MariaDB.
- [x] Buscar soluciones para aplicar sistemas de logs para SSH en contenedor Docker.
- [x] Intento de aplicar sistemas de logs para SSH. (Fallido)

# 08/03/2024:

- [x] Buscar soluciones para aplicar sistemas de logs para SSH en contenedor Docker.
- [x] Intento de aplicar sistemas de logs para SSH. (Fallido)
- [x] Practicar con Dockerfile y scripts para automatizar comando es el inicio de una imagen Docker.
- [x] Practicar cómo subir imagenes de Docker a Mi repositorio GitHub.

# 09/03/2024:

- [x] Hacer commit del contenedor sin registros de haber sido vulnerado.
- [x] Atacar las vulnerabilidades del contenedor dejando rastro.
- [x] Hacer commit del contenedor una vez ha sido atacado, con presencia de logs.
- [x] Documentar procedimiento.


# 11/03/2024:

- [x] Conocer el procedimiento para subir imágenes de Docker a GitHub.
- [x] Hacer pruebas y subir las imágenes de Docker creadas a Docker.
- [x] Hacer pruebas de su correcto funcionamiento.

# 13/03/2024:

- [x] Buscar posibles CVE que se puedan implementar en la segunda máquina.
- [x] Descargar y hacer pruebas con diferentes softwares para poder implementar en la segunda máquina.
- [x] Probar varias opciones de configuraciones apache (diseño de la máquina 2)

# 14/03/2024:

- [x] Buscar otros posibles CVE que se puedan implementar en la segunda máquina. (Algunos no funcionan correctamente)
- [x] Descargar y hacer pruebas con diferentes softwares para poder implementar en la segunda máquina.
- [x] Probar varias opciones de configuraciones apache (diseño de la máquina 2)

# 15/03/2024:

- [x] Plantear y buscar diferentes opciones para el segundo contenedor
- [x] Planteamiento de la vulnerabilidad relacionada con el riesgo principal
- [x] Probar algún software con CVE del 2023 en adelante en Docker 
- [x] Finalización (fallida) de recreación de una vulnerabilidad

# 18/03/2024:
- [x] Investigar posibles vulnerabilidades (CVE) desde el año 2023 en adelante.
- [x] Reproducir adecuadamente una vulnerabilidad.
- [x] Identificar la debilidad en relación con el principal riesgo.

# 19/03/2024:
- [x] Replantearnos la opción elegida para hacer el CTF debido a varios errores encontrados en la creación de éste mismo.
- [x] Buscar y testear otras opciones para hacer el CTF de nuestra vulnerabilidad.

# 20/03/2024:
- [x] Descargar y aplicar software encontrado en nustro CTF (funcionamiento correcto por el momento)
- [x] Conocer a fondo el software y instalar algunos servicios para el desarrollo de nuestro CTF, entre ellos SSH, apache, MariaDB...

# 02/04/2024:
- [x] Crear cuenta y probar funcionamiento de DockerHub
- [x] Pruebas de subir imágenes de docker a DockerHub (fallido)

# 03/04/2024:
- [x] VOLVER A CREAR LA CTF DE INYECCIÓN DE NUEVO!!! (daba error de todas las formas posibles al subirlo a DockerHub)
- [x] Completar la CTF y hacer commit para tener versión con logs para hacer Forense
- [x] Crear repositorio en DockerHub
- [x] Subir las dos imágenes a DockerHub (previa al ataque y posterior al ataque)
