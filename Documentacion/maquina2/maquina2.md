## Objetivo Maquina2
Esta maquina va ser diseñanada para explotar la vulneravilidad **A09:2021 – Security Logging and Monitoring Failures**.

## Plantemiento
Para ello vamos a alojar varios servidores, PaperCut, apache, telnet y una base de datos utilizando mySQL. El servidor PaperCut será vulnerable al CVE-2023-27350. Gracias a eso podremos entrar al servidor PaparCut y ver todos los usuarios creados en la máquina. Uno de los usuarios tendrá las credenciales débiles y lo aprovecharemos para hacer fuerza bruta por telnet para conectarnos con ese usuario. Una vez dentro de la máquina podremos ver que hay más servicios corriendo y podremos acceder a ellos. Uno de ellos será WordPress, donde podremos entrar y podremos encontrar una pista

## Configuración del entorno
Para ello, vamos a crear un contenedor Docker con el sistema operativo Ubuntu Server. Los servicios que vamos a utilizar son:

![](/Assets/M2.png)

- **TELNET**: *Telnet 0.17-42* --> Para administracion remota.
- **HTTP**: *Apache 2.4.58* --> Para el servidor web.
- **MySQL**: *MySQL 8.3* --> Para la base de datos.


## Pasos a seguir

1. **Instalación de Docker**
2. **Creacioon del Dockerfile**