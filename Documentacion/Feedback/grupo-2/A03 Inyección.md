Preparación de la Máquina
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/c040c40a-5414-4b09-a522-a2f1c247411e)

Explotación:
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/34dc50b8-fccb-4e01-8a90-2a296f55a56a)

Escaneo rápido de puertos en uso:
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/11b162dd-8692-4057-999b-66e8fc513ae2)

Veremos una web, que estará en mantenimiento y no contiene ningun dato util. Así que buscaremos por subdirectorios ocultos.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/21441801-f0d6-4fc6-8438-dc0d3a01c38c)

En la web que nos sale, /farm/ veremos una pantalla de login para la cual tampoco tenemos nada util que ver ni datos que usar. Así que volveremos a hacer un escaneo en búsqueda de algún dato oculto en subdirectorios.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/39fc1203-fe4d-4944-90a7-d63fd18f2842)

Vemos el /database/ el cual al entrar nos revelará este archivo sql.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/093265ec-abea-4250-ba36-387c13766a7f)
Dentro del sql veremos unas credenciales. La contraseña parece ser un hash cifrado.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/26018e96-9e38-4c94-8ee6-3ebfa1b01899)

Encontramos fácilmente como desencriptarla en la web de hashes.com
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/366a1bdd-7603-478d-9640-6f0bc06dfe47)

Una vez hemos entrado con las credenciales, observando la web veremos una opción para subir ficheros. Trataremos de hacer un reverse shell aprovechando esta vulnerabilidad.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/42e14a9d-27a9-4d02-b7cb-8ac1046d13c8)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/4df5d695-3d81-4c93-9eb5-28d3d0ca7a93)

Explorando las carpetas con el acceso limitado, visitamos la web y veremos unos subdirectorios web ocultos al que podremos visitar.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/b0dacdec-fd01-4027-b006-b23f12df2f99)

Visitando la web, veremos que hay unas credenciales que hacen una ejecución SQL directa, aprovecharemos esto para hacer una inyección SQL.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/00593297-c389-421e-a4b3-0ed8b0813f75)
Resultados de la inyección:
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/517da44e-51dd-42ba-a4c0-8b8734c83c3c)

Las credenciales aparecen estar encriptadas en Base64, al desencriptarlas tendremos esto:
T2lua09pbms= > OinkOink
V2lrV2lr > WikWik
Y3VpZGFtZWFsb3NjZXJkaWNvcw== > cuidamealoscerdicos

Con estas credenciales nos conectaremos a los usuarios en busqueda de datos útiles.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/d6f42fa9-f115-46a1-9965-14250e1933bb)

Con SCP obtendremos los datos encontrados.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/2a61489b-97e2-4e89-9dc4-84c40c6b0d77)

Una vez tenemos el ZIP, veremos que tiene contraseña, así que rápidamente con John lo petamos.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/04e8670b-7dff-419d-9902-152449d49300)

Ahora tenemos acceso a otras credenciales para el ssh!
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/df3975b8-35aa-4e0c-9984-f5b3ca2d8734)
R3JhbmplcjA0ZG1pbjM= > Granjer04dmin3

Una vez dentros, veremos que capacidades tiene el usuario rápidamente viendo comandos que ha estado ejecutando.
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/a5bd42e2-3914-49d2-86b8-2c3032c0b366)
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/e5412f7f-3069-47a3-bdd0-6754c3406c60)

Accedemos al usuario root y veremos que datos podremos encontrar en /root/
![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/160483285/0e2c6729-5435-479b-a5d5-03bb3b8d5de8)


FEEDBACK:
Es una máquina fácil de hacer y con una progresión muy linear. Tal vez el panel web se podría haber simplificado más, no hay necesidad de tener funciones reales de php para algo que no se va a usar.
