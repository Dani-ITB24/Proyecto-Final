## Writeup

En primer lugar hago un scaneo de puertos y solo está abierto el 80 así que decido hacer un Fuzzing:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/6c551145-361d-48cb-bb4f-13f09fb328d1)

La web principal es una landing page default de Apache2:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/419be0ac-bfed-4a04-a63b-2d6e17efc53f)

Con Fuzzing encuentro que tiene un wordpress:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/97b4ed4e-3aa9-4895-a45b-d9bab588989e)

Realizo un scan con el comando "wpscan" pasra ver si encuentro algo interesante:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/822d8f33-3a9c-4e8c-afbf-5b2cf94c25eb)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/55099944-24a8-4dc5-910d-b65f7b845e5c)

Investigando un poco veo que el plugin "mail-masta" es vulnerable, así que pruebo a explotarlo. Encuentro que es vulnerable a Local File Inclusion por lo que puedo leer archivos críticos, en /etc/passwd por ejemplo encuentro un usuario llamado "daniel":

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/cf3a032b-4a74-4acb-99e6-fc30555dcaa1)

Uno de los archivos más críticos de wordpress es "wp-config.php" por lo que intento leerlo, pero parece que no puedo:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/dbffb9f8-42ce-4bdc-b5ba-ce6046912ef0)

Sin embargo si lo encodeo en Base64 sí:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/7c44225d-3b1a-4fe3-8d24-e0c8fbcd4b6a)

En este archivo encuentro unas credenciales, que parecen funcionar en el login wordpress:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/2a656b72-bd4a-40a1-9324-e761ddba0d89)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/3d77cca6-f169-4fa2-8699-6b74501a61bd)

Veo que soy administrador por lo que aquí ya puedo hacer lo que quiera:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/d1e4b6c3-0504-4c58-9549-726d5ba263e6)

Meto una reverse shell en un plugin: 

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/ec18e9c1-58bd-4d06-bda1-f91fa457ac12)

Pongo el puerto en escucha y activo el plugin para que se ejecute:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/2cebb9a0-9cbc-4a0f-b771-2d49b27209e3)

Aparéntemente no puedo hacer nada así que vuelvo a revisar todo el proceso y encuentro unas credenciales más en el wp-config.php que no había visto:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/d7736482-0c6a-4f31-b288-3ac726e11fbd)

Decido probar a ver si es la contraseña del usuario daniel de casualidad, y funciona:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/2766a498-9cb9-4f43-817f-a144a24a87a4)

Encuentro la flag de usuario:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/b60447a5-8909-4e25-a7d4-8b16a29e2c23)

Para escalar privilegios sigo el proceso que habitualmente hago y encuentro lo siguiente:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/cc318bb7-abf6-4e10-8fab-6b70790dd391)

Exploto vim.basic haciendoo uso de GTFO Bins y ya soy root, encuentro la flag en /root:

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/79e6b79d-942d-453d-902d-b124f94cb819)

![imagen](https://github.com/Dani-ITB24/Proyecto-Final/assets/99719204/6914eaff-73cc-492f-9c9b-f130e616f7a2)

## Feedback

Cumple con los problemas de seguridad asignados y además han implementado vulnerabilidades que hemos visto durante el curso. Bien planteada, algunos puntos un poco rebuscados.

