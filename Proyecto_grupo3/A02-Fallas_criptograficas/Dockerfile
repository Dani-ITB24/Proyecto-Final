FROM ubuntu:20.04 as base

# Actualizar e instalar paquetes necesarios
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mysql-client \
    mysql-server \
    apache2 \
    openssh-server \
#    openssh \
    php-mysql \
    libapache2-mod-php \
    php \
    unzip \
    php-cli \
    nano \
    sudo \
    curl 

ADD entrypoint.sh /usr/local/sbin/
RUN a2enmod rewrite

ENTRYPOINT ["entrypoint.sh"]
#CMD ["entripoint.sh"]
#CMD ["/bin/bash"]

EXPOSE 80
