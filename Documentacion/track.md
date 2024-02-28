# Desarrollo Formulario Vulnerable a SQLi

Para el desarrollo del formulario hemos empleado únicamente HTML, CSS y PHP.

- **HTML:** Estructura del formulario
- **CSS:** Personalización del formulario
- **PHP:** _Backend_ del formulario (validación & conexión con la base de datos)

El script en php está hecho de manera que no valida correctamente la entrada. De esta manera es vulnerable a inyección SQL.

**Representación gráfica de la validación errónea:**

<p align="center">
<img  alt="drawing" width="400" height="400" src="./images/sqli.png" />
</p>

**Apariencia final del formulario:**

<p align="center">
<img  alt="drawing" width="600" height="400" src="./images/formularioFinal.png" />
</p>

# Instalación de Docker - Creación y Desarrollo Contenedor Nº1

Para el desarrollo del primer contenedor, instalamos Docker siguiendo el [tutorial](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) de la documentación oficial de Docker. Una vez hecho esto comenzamos con la creación del contenedor de manera manual:

<p align="center">
<img  alt="drawing" width="600" height="175" src="./images/1.jpeg" />
</p>

Descargamos la imagen de ubuntu para docker:

<p align="center">
<img  alt="drawing" width="600" height="100" src="./images/2.png" />
</p>
<p align="center">
<img  alt="drawing" width="600" height="100" src="./images/3.png" />
</p>

A continuación creamos el contenedor con esta imágen:

<p align="center">
<img  alt="drawing" width="600" height="70" src="./images/4.png" />
</p>

## Prueba Instalación MariaDB 

Para instalar y poner contraseña a root dentro del contenedor:

```
apt install mariadb-server
service mariadb start
mariadb
```

Una vez dentro:

```
USE mysql;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'contraseña';
flush privileges;
exit;
```

A continuación accedemos con el usuario root con el comando:

```
mysql -u root -p
```

Para crear la base de datos y un usuario válido en el formulario SQLi:

```
CREATE DATABASE db1;
use db1;
CREATE TABLE users(id CHAR(30) NOT NULL,user CHAR(20) NOT NULL,password CHAR(20) NOT NULL);
INSERT INTO users VALUES ('0','usuarioPrivilegiado','passUserPriv1');
```

Comprobación:

<p align="center">
<img  alt="drawing" width="600" height="500" src="./images/9.png" />
</p>



## Prueba Conexión DB con Validador PHP

## Prueba Creación de Snapshot en Docker

Comando empleado:

```
sudo docker commit ubuntu ubuntu1
```

<p align="center">
<img  alt="drawing" width="600" height="150" src="./images/7.png" />
</p>

Y para ejecutarla:

```
sudo docker run -it --name ubuntu1 ubuntu1
```

<p align="center">
<img  alt="drawing" width="600" height="100" src="./images/8.png" />
</p>
