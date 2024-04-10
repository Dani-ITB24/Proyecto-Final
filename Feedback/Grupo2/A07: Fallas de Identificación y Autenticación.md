# **Explotación**

Realizamos el reconocimiento de puertos mediante la herramienta de nmap y detectamos los puertos **22 y 80** levantados.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/dfad60a6-29ff-46de-8f58-36e63d6d0f89)

Lanzamos un escaneo más especifico sobre los puertos para hacer un reconocimiento de sus versiones.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/d43fd5fe-73df-4c58-97d8-786b1c7b3ea9)

Accedemos a la web y se nos muestra la landing page indicanos que actualmente la pagina web es fuera de servicio

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/6c23a9cb-d76b-48e4-9639-5b28591fbaa9)

Mediante la herramienta de WFuzz buscamos rutas escondidas a través de un diccionario de rutas web conocidas, de esta forma encontramos que la ruta de **accountlogin** se puede acceder al recibir una respuesta con codigo de estado 200.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/f5686334-bdbe-454d-a43b-680ca102cec4)

Al acceder a esta routa de **accountlogin** accedemos a otro landpage con un panel de user y admin login.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/db2f7491-6fe2-4fc2-bdc2-5c6a87caae41)

En el panel de admin vemos que podemos logearnos introduciendo un email y contraseña.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/f617abdf-e587-4d5d-809f-5bbb69bcb782)

Realizando un par de busquedas en Google con palabras especificas como "default credentials" e  introduciendo el nombre de este CMS de **Online Tours and Travels Managament**, encontramos la siguiente web en donde nos muestra el correo por defecto del gestor CMS.

[Busqueda Google](https://www.google.com/search?q=online+tours+and+travels+management+system+project+in+php+credentials&client=firefox-b-e&sca_esv=ee5823111fbad417&ei=X2EVZo7XOuWhi-gPk_2E4AI&ved=0ahUKEwjOgsrou7WFAxXl0AIHHZM-ASwQ4dUDCBA&uact=5&oq=online+tours+and+travels+management+system+project+in+php+credentials&gs_lp=Egxnd3Mtd2l6LXNlcnAiRW9ubGluZSB0b3VycyBhbmQgdHJhdmVscyBtYW5hZ2VtZW50IHN5c3RlbSBwcm9qZWN0IGluIHBocCBjcmVkZW50aWFsc0jiKFDVDli7J3ABeAGQAQCYAZYBoAGbCKoBAzAuObgBA8gBAPgBAZgCBKACmgPCAgoQABhHGNYEGLADwgIGEAAYFhgewgIFECEYoAGYAwCIBgGQBgiSBwMxLjOgB_EP&sclient=gws-wiz-serp)

[Web donde se encuentra el correo](https://www.sourcecodester.com/php/14510/online-tours-travels-management-system-project-using-php-and-mysql.html)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/b68c119b-906d-45cd-a3dc-4a12cf111237)

Una vez tenemos el correo, vamos probando con contraseñas basicas como "password, 123456789, etc.", de esta forma encontramos que la contraseña es "admin" y conseguimos iniciar sesión.

Email: mayuri.infospace@gmail.com

Contraseña: admin

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/a0b5f9f0-23d1-427a-a162-d88ad58b6c78)

Una vez iniciada la sesión vemos un dashboard del gestor de contenido de Travel Manager.

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/e603e46d-47cb-44a2-8a70-f481e21f4889)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/07e68ada-1a3c-4e25-83b3-d30b1159cbae)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/a1634771-0124-4a27-a570-8ba3d7cbf05a)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/b60f32c0-b2e2-4d13-ac41-a5ff72fb6cf0)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/52755385-f659-40d9-997f-40a79de339b6)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/69a9be5f-27e1-47f8-8131-12e2e11e2700)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/e52f5eef-e6e5-49f3-8456-bd70bccc6f13)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/98250fc5-30fd-4399-be0f-3ce7eabb8c62)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/3e109a3f-293f-4bd1-b3ca-74e080f9384e)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/9a7ad3c2-8b58-4b23-bb4c-7cbc27a17d3d)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/825768d5-26a7-43ea-90dd-4f6d97f108fa)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/2fe24947-ae40-45bc-8cdc-41a75685d757)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/59b94f42-84b4-477a-9930-98dcfdaa8908)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/796b0e1a-c9d5-481a-ad6a-0b642bc534de)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/3151862f-2204-4488-a1d0-ef3b2df7c385)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/c67959b5-23f3-4608-ba8e-4d6b28913ee2)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/2f7d88f3-f6c0-45c5-862f-1838acb73206)

![image](https://github.com/Dani-ITB24/Proyecto-Final/assets/160504744/fbc42e92-c9f3-4ce1-a70e-bd89955205e4)






# **Feedback**

Realizamos el reconocimiento de puertos mediante la herramienta de nmap y detectamos los puertos **23, 9191, 9192, 9193 y 9195** levantados.

