# **Explotación**

Realizamos el reconocimiento de puertos mediante la herramienta de nmap y detectamos los puertos **23, 9191, 9192, 9193 y 9195** levantados.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/fecbef20-71dc-4628-a655-29d7b414e0d6)

Accedemos a la maquina mediante la IP y el puerto 9191, de esta forma vemos que se nos muestra un panel de administración del software de Paper Cut NG versión 18.3.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/df4756d2-b2fb-4057-9713-08b925defad5)

Mediante la herramienta Searchsploit buscamos vulnerabilidades de papercut y encontramos 2.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/3d3617e1-5479-496e-b07a-bfecadb46a67)

Investigamos el contenido de la vulnerabilidad en Paper Cut relacionada con Authentication Bypass.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/57b61d8d-efbc-4602-831a-606560a1e10d)

El contenido del script nos muestra que Paper Cut tiene una URL para hacer un Bypass de la autenticacion.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/071383a8-348d-43e3-8dc8-19a3d4bef454)

Introducimos esta URL en el navegador y verificamos que hacemos el Bypass correctamente.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/91dd7466-289e-41f5-943d-9561b432e114)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/50834404-ad11-46ed-a416-ea06a22944c5)

Nos ponemos a investigar usuarios pero no encontramos nada que nos pueda servir, por lo cual despues de investigar vemos que en el menu de **Devices** esta "bloqueado" y podemos desbloquear esta parte de la web eliminando una parte del codigo web.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/92461e7a-45c1-4524-b33c-076b47588704)

Al eliminar la parte del codigo vemos que ya podemos movernos por esa zona de la web y accedemos a la **Impressora Grail**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/ad10b42d-9173-41ab-b2b1-3cdbc7ec9f6d)

Hacemos el mismo proceso anterior en esta nueva pagina.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/dae3d683-be42-4541-a655-5018793356bc)

Una vez se nos ha desbloqueado la pagina y podemos movernos libremente vemos que existe un usuario **thegrefg** con una contraseña que no podemos visualizar.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/47733efb-ca39-44e7-9458-f554a39672d0)

Si modificamos el codigo HTML y cambiamos el valor del input de **password** a **text** podemos visualizar la contraseña.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/e1d17715-13b1-4ec3-9260-b74ace5f66ad)

Probamos este usuario **thegrefg** y su contraseña **Never_surR3nder** mediante telnet, y conseguimos acceder a la maquina autenticados con el usuario **thegrefg**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/67e645d3-490b-4408-93fb-da22416b7925)

Como tenemos acceso como **thegrefg** mostramos el contenido de su /home y vemos lo siguiente.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/68cccf01-39c8-4fa4-a947-49a4b8518fa8)

Buscamos formas de escalar privilegios y encontramos que se encuentra habilitado el puerto **445** internamente el cual pertenece al servicio SMB.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/05efc57b-7f54-4364-b36e-43afbdecd26d)

Listamos el contenido compartido mediante el servicio SMB localmente.
Buscamos el directorio de **videos** y vemos que se encuentra ubicado localmente en la ruta **/var/andorra/videos**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/d60c856c-ed8c-4a23-976c-1877bac85964)

Intentamos acceder a este recurso como el usuario **thegrefg** y su contraseña pero no tenemos permisos.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/ee5bcd04-f900-4c8d-aedb-ce3c6a2e8e1a)

Listamos el contenido del directorio y vemos que dentro existe un fichero **youtbe.md** el cual solo puede acceder el usuario lolito.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/683286fc-6171-4a80-82b4-e03ffacd0b92)

Ejecutamos la herramienta de chisel en modo servidor en nuestra maquina atacante.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/473ebd95-9bb6-4ccf-bd93-5d704fa27458)

Ejecutamos la herramienta de chisel en modo cliente en nuestra maquina atacada y establecemos una conexión con la maquina atacante.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/fe95ab57-e343-4b64-9863-5409eabf7e9c)

Mediante la herramienta de msfconsole, utilizamos el exploit de smb_login para realizar fuerza bruta y establecemos los parametros que queremos utilizar.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/566022d2-3530-4c47-8059-55a379484f3a)

Al ejecutar la fuerza bruta encontramos que la contraseña del usuario **lolito** para autenticarse en SMB es **lamborghini**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/8ea9acd3-e284-4241-a615-b3b9f70ef31f)

Probamos a acceder mediante este usuario y contraseña y conseguimos el acceso, por lo cual nos descargamos este recurso de **youtbe.md**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/68c517b5-d4a3-431e-b5ec-cb46a7526ba8)

Mostramos el contenido de **youtb.md** y parecen contraseñas.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/4762f0ac-76ac-49f9-97cf-e6204f271ec6)

Nuevamente mediante la herramienta de msfconsole, realizaremos fuerza bruta al servicio de telnet y estableceremos los parametros que queremos utilizar, escogiendo este fichero que parece tener contraseñas.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/b4798cad-4b57-4f22-b135-b449ad3e6717)

La fuerza bruta finaliza encontrando que la contraseña de inicio de sesion de **lolito** es **Valorant**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/44699ae0-2f0f-41b6-a2cd-5b4c38f8bac3)

Dentro del inicio de sesion con el usuario **thegrefg**, cambiamos de usuario a **lolito** con la contraseña encontrado y verificamos que hemos cambiado de usuario a **lolito**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/95dedc4a-8bef-4984-a3eb-a2e497e03a4b)

Listamos el contenido del /home de **lolito**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/b7de7e52-6ac0-482f-a6f3-4a4dae247ab6)

Mediante el comando **sudo -l** visualizamos que el usuario de **lolito** puede ejeuctar el script con nombre **script.py** en python3 como el usuario ampeter.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/20e393f5-46e5-4f02-a490-7f2be098a823)

Mostramos el contenido del script de **python_path.py** y entendemos que este muestra el path que tiene el usuario de lolito y vemos que como primera opcion busca en su /home/lolito.

Además vemos que el script random.py sirve para spawnear una bash.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/fc6274d8-0a7c-44f5-a82d-b877c5f6627c)

Mostramos el contenido del script de **script.py** y vemos que utiliza las librerias random, time y sys.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/81f0fe5d-ac55-45aa-a506-4af5d0e8781d)

Ejecutamos el script como el usuario ampeter y verificamos que se nos cambia al usuario **ampeter**.

Esto sucede ya que se realiza un library hijacking en **python**, ya que el path primero se fija en las librerias que se encuentren en /home/lolito y aqui se encuentra la libreria maliciosa de **random.py**

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/d152603e-fd2e-4001-b4f9-bf91ef3d6106)

Listamos el contenido de /home/ampeter y encontramos la flag del usuario.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/5874e3b2-42f7-491c-9075-77722d070edd)

Mostramos el contenido del script **compress.sh** y vemos que su funcionamiento es moverse a /home/ampeter y comprimir todo el contenido del directorio dentro de un fichero **backup.tar.gz** ubicado en /tmp.

Verificamos que este contenido se comprime y se guarda en la ruta especificada.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/042bae68-05e7-40b2-84b3-f5fcc4709aa9)

Buscamos tareas cron y nos dirigimos al directorio de /etc/cron.d y listamos el contenido.

Vemos que existe una tarea **hello** el cual se encarga de ejecutar el script **compress.sh** cada minuto y esta tarea la realiza el usuario **root**.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/46a055dc-b70c-4a0e-ace2-3dec0aca3b9f)

Para poder abusar del comando de **tar**, utilizaremos unos parametros para tener la capacidad de ejecutar comandos, estos parametros los crearemos como ficheros dentro del home de **ampeter**. Una vez los hemos creado, esperaremos a que se ejecute el script.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/bd334284-ca1d-4590-959a-f95f00383e83)

Con el usuario **ampeter** ejecutamos el comando **sudo su** ya que si nuestro abuso del comando de **tar** y sus parametros han funcionado bien, el usuario ampeter tiene permisos para ejecutar cualquier comando con sudo.

Verificamos que cambiamos de usuario a root sin necesidad de contraseña y podemos visualizar la flag de root.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/a6e9dd28-7205-48e4-a15b-f6bd8d918eea)

# **Feedback**

La maquina esta muy bien pensada y en momentos es bastante rebuscada, pero en lo general son cosas que hay que pensarlas bastante.

En cuanto cosas que me he ido encontrado mientras explotaba la maquina es que el historial del usuario **lolito** y **ampeter** no se habia borrado.
El **chisel** se encontraba dentro del usuario **thegrefg** nada más acceder con este usuario.
Al cambiar al usuario **ampeter** se muestran los comandos que se han ejecutado para abusar del comando **tar**.

En general la idea de la maquina esta muy bien y es original, lo unico que se han dejado muchos detalles de eliminar las pruebas cuando hacian la maquina ellos mismos.
