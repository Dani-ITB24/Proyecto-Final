#!/bin/bash

# Iniciar los servicios necesarios
service vsftpd start &
service ssh start &
service apache2 start &
# Iniciar Tomcat
/opt/tomcat/bin/catalina.sh run &

wait
#tail -f /dev/null
