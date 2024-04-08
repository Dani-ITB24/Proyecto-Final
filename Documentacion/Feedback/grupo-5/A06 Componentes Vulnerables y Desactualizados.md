# VM 2 A06 - Vulnerable and Outdated Components
He tenido que mirar el pentest porque teneia que mapear tambien el puerto 8009 porque no conseguia avanzar.
## enumeracion de puertos

primer escaner con nmap
vm2-imagen1
### web 80 y 8080
Realizacion de busqueda de directorios con gobuster y no se encuentra nada relevante
vm2-imagen2
vm2-imagen3

Se busca vulnerabilidades y despues de mirar documentacion varia se encuentra un exploit para la version del apache tomcat, que se usa el metasploit para ejecutarlo.

vm2-imagen4

Podemos ver que aparece un usuario un texto que parece que esta en codificado. Si buscamos en que esta codificado en internet nos dice que esta en base64, despues lo descodificamos y nos sale un texto logico.

vm2-imagen5

revisando los permisos del usuario no se encuentra nada se puede ver que tiene sudo y con el comando sudo -l vemos que se puede ejecutar el vim en root

vm2-imagen6

con el comando find buscamos la flag

vm2-imagen7