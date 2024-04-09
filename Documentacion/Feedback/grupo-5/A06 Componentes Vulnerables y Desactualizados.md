# A06 - Vulnerable and Outdated Components


## Enumeración de puertos

primer escaneo con nmap

![vm2-imagen1](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/09c3e776-8d08-4c14-9cf2-12e3bbd79668)


## Web 80 y 8080

Realización de búsqueda de directorios con gobuster y no se encuentra nada relevante

![vm2-imagen2](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/71c08b8c-8f85-494d-86a5-cc736e9bc28e)

![vm2-imagen2](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/71c08b8c-8f85-494d-86a5-cc736e9bc28e)

Se busca vulnerabilidades de los servicios implicados ftp, ssh y tomcat y después de realizarlo con el searchsploit solo se encuentra varias vulnerabilidades del tomcat, con lo que se busca mas informacion y se encuentra un exploit para la versión del apache tomcat, que se usa el metasploit para ejecutarlo.

![vm2-imagen4](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/c23701bf-8b77-466c-aa71-6b00f004e76c)


Podemos ver que aparece un usuario un texto que parece que está codificado. Si buscamos en que está codificado en internet nos dice que está en base64, después lo decodificamos y nos sale un texto lógico.

![vm2-imagen9](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/1e8ae768-fc26-4700-829c-bb6f7a8ca09f)
![vm2-imagen10](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/3f115876-76bd-4039-bc3d-6c76bb3a822b)
![vm2-imagen11](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/f44bd4aa-00e1-463b-92c3-a3fdbc0dacab)

Revisando los permisos del usuario no se encuentra nada
![vm2-imagen8](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/3b8da4e7-c6ac-40d2-a223-b3fb197f6cae)

El comando sudo esta disponible con lo que se usa el comando sudo -l vemos que se puede ejecutar el vim en root

![vm2-imagen6](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/c38dee03-2ee5-42c6-b63a-1369d74c6d73)

si ejecutamos “ sudo vim -c ‘:!/bin/bash’ ” obtenemos una shell en root
![vm2-imagen6](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/c38dee03-2ee5-42c6-b63a-1369d74c6d73)

con el comando find buscamos la flag

![vm2-imagen7](https://github.com/Dani-ITB24/Proyecto-Final/assets/160484965/9329358c-6c7e-4c63-817e-50b52c37c449)

## Feedback
He tenido que mirar el pentest porque tenía que mapear también el puerto 8009 porque no conseguía avanzar. Al finalizar con el pentest, miro el history y veo que esta el comando sudo -l que no me di cuenta.

![](Aspose.Words.f8191dfc-2a9e-4ebd-ae8f-b1367f049d97.011.png)

