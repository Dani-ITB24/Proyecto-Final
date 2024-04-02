
 ## Lunes 19/02/2024
 
- Creacion de la estructura (Carpetas).
- Reparticion de tareas.
- Informarme de funcionamiento de GitHub.
- Primera planificacion de grupo .

 ## Martes 20/02/2024
 
- Creacion y empiece del documento final, explicando cada vulnerabilidad y dus diferencias.
- Visualicacion de las CWE's de las dos vulnerabilidades.
- Recuento de ideas para posibles vulnerabilidades con las diferentes maquinas.
- Instalacion de maquina virtual para probar a subir imagen docker a github, y poder llevar un seguimiento de ello.

 ## Miercoles 21/02/2024

- Se pudo subir el archivo dockerfile a github pero no la imagen como tal, a si que utilizaremos docker hub para subir imagenes docker, y tener registro de cambios.
- Creacion de cuenta DockerHub, y repositorios para la subida de imagen de cada maquina.
- Busqueda de CWE's para maquina diseño inseguro.
- Tests de imagenes de docker.

 ## Jueves 22/02/2024

 - Creaciones de imagenes docker y subirlas a DockerHub.
 - Resolver el error de que las imagenes a la hora de hacer run, que antes no funcionaba.
 - He hecho un informe en drive, paso a paso para crear imagen docker, activarla, como modificarla, como guardarla y subirla a DockerHub.
 - Subiendo imagen a repositorio compartido en vez del mio, para poder trabajar en el mismo repositorio , y la misma imagen.

 ## Viernes 23/02/2024

 - Creación de dockerfile para la primera maquina. 
 - Creación de la imagen de la primera maquina.
 - Configuración de apache y creacion de pagina web dentro de la imagen.

## Luens 26/02/2024

- Insalación de servivios y herramientas en la maquina Diseño inseguro.
- Creación de pagina web y configuracion de ella.
- Modificación de ftp, usuarios y permisos.
- Resolviendo problema de usuarios en ftp.

## Martes 27/02/2024

- Modificación de la web inspirada en The Originals.
- Probando la reverse sell en la web para entrar como www-data.

## Miercoles 28/02/2024

- Repartimiento de permisos ftp.
- Prohibición de registro en sistema operativo con el usuario elijah(ftp).

## Jueves 29/02/2024

- Resolución del problema de permisos de ftp.Elijah solo puede entrar por ftp nada mas.

## Viernes 01/03/2024

- Creación de zip con contraseña dentro de una imagen(jpg).
- Subida de imagen con los cambios realizados hoy :
![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/0b72577a-b692-4cbc-bc4c-bc9673d5f1f1)

## Lunes 04/03/2024

- Documentacion de todo lo creado y utilizado.

## Martes 05/03/2024

- Ayer y hoy con fiebre por anginas
- Intento de resolver problema de cambio de version ssh. Al realizar este cambio el contenedor se apaga y si quiero iniciarlo de nuevo sale esto:
  ![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/84489cba-d651-4142-b29c-26f8251b8fc5)

## Miercoles 06/03/2024

- Primera maquina lista.
- He acabado la explicación de parte del ataque a la maquina.
- Cambio de contraseña en el elijah y del zip que esta dentro de la imagen, ya la contraseña de cada una de ellas estaba en un numero muy elevado(8 millones), y cuando alguien intente hacer un hydra para sacar una de las contraseñas puede pasarse demasiado tiempo.
- Visualización de logs de la maquina para intentar hacer el análisis forense.
- Busqueda de herramientas para hacer un análisis forense con imagen docker.

## Jueves 07/03/2024

- Epiece del análisis forense.
- Utilización de guia para el análisis anteriormente utilizada para otros análisis forense.
- Modificaciones de la documentación final.

## Viernes 08/03/2024

- Actualizacion del analisis fornese.
- Busqueda de logs para ver cuando se ejecutan los diferentes scripts.
- idea de la seguna maquina

## Lunes 11/03/2024

- Creación de la seguna maquina, con dockerfile diferente.
- Configuración del ftp acabada, con el usuario anonymous que entre en su propia carpeta, y solo pueda visualizar una imagen puesta a proposito.
- Instalación y configuración del apache, con cubecart.
- Visualización de la web cubecart y investigación de que se puede hacer con ella.

## Martes 12/03/2024

- Modificación de idea de la maquina, y vuelta a crear dockerfile.
- Problema al instalar woedpress.
  ![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/f618b89f-513f-4b27-b0e9-a2ee51bc99b1)

## Miercoles 13/03/2024

- Problema anterior solucionado
- Busqueda de pluguins vulderables y intentar explotarlos.

## Jueves 14/03/2024
- Instalación de wordpress 5.5.1 mas el plugin mail-masta para conseguir la vulnerabilidad.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/157145186/f336d616-d9d1-4f88-bca4-01b9f081553e)

## Viernes 15/03/2024

- Creación de usuario para subir de privilegios desdes www-data.
- Puesta en prueba la vulnerabilidad mail-masta.
- Explicación de como se ha creado la maquina, que se ha implementado y porque.

## Lunes 18/03/2024

- Explicación de las vulnerabilidades que he implementado y como explotarlas.

## Martes 19/03/2024

- Documentación de explotación de la maquina como si fuera atacante.

## Miercoles 20/03/2024

- Retoques finales.

## Jueves 21/03/2024

- Retoques finales.
- Evaluación del forense.

## Martes 02/04/2024

- Descarga de maquinas a las que analizar.
- Explotación de primera maquina del grupo5 realizando la explicación de como lo he hecho.
- Comienzo de la explotación de la segunda maquina del gruipo5, mas la explicación de ello.
