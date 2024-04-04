# **Índice**

<span style="color:black;">1. [ Búsqueda de direcciones IP](#direccionesIP)</span><br>
<span style="color:black;">2. [ Búsqueda de direcciones IP](#vulnerabilidades)</span><br>
<span style="color:black;">3. [ Otros recursos encontrados](#otros)</span><br>
---
<br>

<h1 name="direccionesIP">1. Búsqueda de direcciones IP</h1>

> netstat -tuln

<br>

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-2.png)

Se ha encontrado lo siguiente: <br>
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-3.png)

<br>

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-4.png)


<h2 name="vulnerabilidades">2. Búsqueda de vulnerabilidades</h1>
Sabemos que la versión que hay instalada del Papercut es la versión 18.3. Así que hemos buscado su CVE

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-5.png)

De todas las vulnerabilidades ha habido que ha destacado en particular:
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-6.png)

Se ha buscado un exploit para explotar esta vulnerabilidad. Y se ha encontrado un github que te da un python para explotar esa vulnerabilidad.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-7.png)

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-8.png)

En el archivo python se ha mirado que hacia exactamente. Se ha visto que si se añade "/app?service=page/SetupCompleted" a la url se puede vulnerar la aplicación.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-9.png)

Se ha añadido ese texto a la url y hemos podido vulnerar la aplicación.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%201/A09%20-%20Fallas%20en%20el%20Registro%20y%20Monitoreo/Assets/maq2A09-10.png)
