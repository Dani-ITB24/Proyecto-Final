## Intento de recreación de la vulnerabilidad CVE-2024-27747

Descargamos el software y lo descomprimimos:

<p align="center">
<img  alt="drawing" width="600" height="100" src="./images/unzip.png" />
</p>

Creamos la base de datos e importamos el archivo .sql proporcionado:

<p align="center">
<img  alt="drawing" width="600" height="300" src="./images/creacionDByVolcado.png" />
</p>

Finalmente cambiamos la configuración del archivo con el usuario y la contraseña que realiza la conexión a la base de datos:

<p align="center">
<img  alt="drawing" width="600" height="300" src="./images/configPHPdb.png" />
</p>

Aparece un error (no lo hemos podido solucionar en 2-3h):

<p align="center">
<img  alt="drawing" width="600" height="100" src="./images/errorWeb.png" />
</p>

## Recreación de la vulnerabilidad CVE-2024-2168

Descargamos el software y lo descomprimimos:

<p align="center">
<img  alt="drawing" width="600" height="100" src="./images/unzipCont2.png" />
</p>

Creamos la base de datos e importamos el archivo .sql proporcionado:

<p align="center">
<img  alt="drawing" width="600" height="300" src="./images/dbCont2.png" />
</p>

Modificamos la configuración de la conexión a la base de datos en los siguientes archivos:

- /user/config.php
- /admin/config.php de la carpeta admin
- /admin/package_details.php de la carpeta admin

Revisamos que funcione y que sea vulnerable:

<p align="center">
<img  alt="drawing" width="600" height="300" src="./images/working.png" />
</p>

Hacemos SQLi con sqlmap:

<p align="center">
<img  alt="drawing" width="600" height="300" src="./images/dumped.png" />
</p>

