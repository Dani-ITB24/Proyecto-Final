# **Índice**

<span style="color:black;">1. [ Forense](#introducción)</span><br>

---

<br>

<h1 name="introducción">1. Forense</h1>

En las capturas del trafico de red realizadas con Wireshark podemos observar como se accede a la web alojada en el puerto **8080**, la cual contenía una version de **tomcat insegura**.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/wireshark8080.png)
Podemos ver como se ha realizado una petición, **con exito**, al recurso **/WEB-INF/web.xml**, en el cual tenemos registradas las claves de un usuario del servidor.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/wiresharkajp.png)

![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/wiresharkajp2.png)
Posterior al ataque, encontramos que se ha descargado un repositorio github aunque no sabemos encontrar que se ha descargado el atacante.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Assets/A06%20-%20Componentes%20desactualizados/Img/wiresharkgithub.png)
