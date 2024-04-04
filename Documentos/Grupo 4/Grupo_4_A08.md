# Grupo 4: Fallas en el Software y en la Integridad de los Datos

## **Índice**

<span style="color:black;">1. [ Enumeración](#Enumeración)</span><br>
<span style="color:black;">2. [ Buscar vulnerabilidades](#Vulnerabilidades)</span><br>
<span style="color:black;">3. [ Flag user.txt](#Flag1)</span><br>
<span style="color:black;">4. [ Escalada de privilegios a Root y flag de root](#root)</span><br>

---

<br>

<h1 name="Enumeración">1. Enumeración</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/nmap.png" alt="nmap">

> nmap -p- -sVC 172.17.0.2 

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/gobuster.png" alt="gobuster">

> gobuster dir -u http://172.17.0.2/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt

<br>
<h1 name="Vulnerabilidades">2. Buscar vulnerabilidades</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/web.png" alt="Wordpress">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/wpscan.png" alt="wpscan">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/wpscan2.png" alt="wpscan2">


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/mail-masta.png" alt="mail-masta">

[WordPress Plugin Mail Masta 1.0 - Local File Inclusion](https://www.exploit-db.com/exploits/40290)

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/plugin-exploitdb.png" alt="plugin-exploitdb">

Como podemos ver, nos facilitan un link directo para poder visualizar el contenido del archivo /etc/passwd del servidor donde se está ejecutando el wordpress:

**http://server/wp-content/plugins/mail-masta/inc/campaign/count_of_send.php?pl=/etc/passwd**

Lo cambiamos por **http://172.17.0.2/wordpress/wp-content/plugins/mail-masta/inc/campaign/count_of_send.php?pl=/etc/passwd**


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/plugin-exploit.png" alt="plugin-exploit">

Gracias al archivo /etc/passwd podemos visualizar los servicios que tiene instalados el servidor, como MySQL Server, entre otros. También podemos observar que existe un usuario **daniel** en el sistema. Vamos a apuntarlo por si nos es necesario en un futuro.

<br>

Ahora que sabemos que podemos acceder a archivos del sistema, podríamos intentar acceder a otros archivos para encontrar posibles credenciales de acceso o alguna otra pista.

https://www.hackercoolmagazine.com/lfi-hacking-beginners/

En esta web podemos encontrar información para intentar acceder a los archivos wp-settings.php y wp-config.php de wordpress.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/info-wp-config.png" alt="Acceder a wp-config.php">

Vamos a intentar esta técnica.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/wp-notworking.png" alt="wp-notworking">

Independientemente de que se añadan más o menos */../* nos continúa saliendo el mismo resultado, no nos devuelve nada.

Investigando, he encontrado una web con técnicas a aplicar para aprovechar mejor el Local File Inclusion:
[Vulnerabilidad Local File Inclusion](https://medium.com/@nyomanpradipta120/local-file-inclusion-vulnerability-cfd9e62d12cb)


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/phpfilter.png" alt="phpfilter">

En este caso vamos a cambiar el **php://filter/convert.base64-encode/resource=index.php** y lo vamos a aplicar de la siguiente manera:  **pl=php://filter/convert.base64-encode/resource=../../../../../wp-config.php**

Lo que vamos a conseguir aplicando el siguiente filtro es poder acceder al archivo wp-config codeado en base64.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/base64.png" alt="base64">

Ahora tenemos un texto cifrado en base64, vamos a proceder a decodearlo.


<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/decode.png" alt="decode">

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/decoded.png" alt="decoded">

Una vez decodeado el wp-config.php podemos ver que hay 2 usuarios y contraseñas en texto plano, en total tenemos la siguiente información:

Usuario: daniel

Usuario: admin
Password: @111wireshark-2

Usuario: alfredo
Password: \_h@ckMy_

Vamos a probar estas credenciales para acceder al panel de administrador de Wordpress.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/wordpress-login.png" alt="Wordpress login">

Accedemos a http://172.17.0.2/wordpress/wp-admin

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/wordpress-admin.png" alt="Wordpress admin">

Ya estamos dentro del panel de administración de Wordpress, veamos que podemos hacer desde aquí.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/reverseshell2.png" alt="Reverse Shell">

Podemos aprovechar el editor de los temas de Wordpress para meter el código de una [Reverse Shell](https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php).

La reverse shell apunta hacia a IP de nuestra máquina atacante **200.200.200.5** por el puerto **4444**. Guardamos los cambiamos del archivo.

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/www-data.png" alt="Reverse Shell www-data">

Antes de guardar el tema con la reverse shell hemos tenido que poner a escuchar a nuestra máquina atacante por el puerto **4444**.

<br>
<h1 name="Flag1">3. Flag user.txt</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/user_flag.png" alt="user.txt flag">

Con el usuario www-data no podemos hacer nada, solo podemos ver que existe el usuario "**daniel**" en el sistema. Si recordamos, anteriormente hemos encontrado 2 contraseñas: **@111wireshark-2** y **\_h@ckMy_**. Vamos a probar acceder con el usuario daniel.


<br>
<h1 name="root">4. Escalada de privilegios a Root y flag de root</h1>

<img src="https://github.com/Dani-ITB24/Proyecto-Final/blob/Grupo5(Eloi-Alan-Fernando-Jose-Zomeño)/Documentos/Grupo%204/img_A08/rootflag.png" alt="Escalada a Root y flag root.txt">


