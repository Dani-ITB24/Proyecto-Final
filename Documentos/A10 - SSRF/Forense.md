# **Índice**

<span style="color:black;">1. [ Forense](#introducción)</span><br>

<br>

<h1 name="introducción">1. Forense</h1>

Con las capturas conseguidas a traves de Wireshark durante el ataque podemos ver que se ha realizado una peticion desde la ip **172.17.0.1**, hacia nuestra web oculta en el puerto 5000 y que ademas dicha peticion esta intenando realizar un ataque SSRF, comprobando los logs del servicio **apache** vemos que la peticion se ha realizado sin errores y por lo tanto el atacante ha podido acceder a nuestra web oculta.
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zome%C3%B1o)/Assets/Img/wireshark.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zome%C3%B1o)/Assets/Img/wireshark2.png)
![](https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zome%C3%B1o)/Assets/Img/apache2log.png)



