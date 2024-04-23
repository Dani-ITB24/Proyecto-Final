FROM ubuntu:20.04 as base

# Actualizar e instalar paquetes necesarios
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mysql-client \
    mysql-server \
    apache2 \
    php-mysql \
    libapache2-mod-php \
    php \
    unzip \
    php-cli \
    nano \
    sudo \
    curl 

#ENV WP_VERSION 6.0

#RUN curl -L https://wordpress.org/wordpress-${WP_VERSION}.tar.gz | tar xzf - -C /var/www/html/
#RUN curl -o /tmp/wp-mig.zip -L https://downloads.wordpress.org/plugin/login-with-phone-number.1.5.5.zip && \
#  unzip /tmp/wp-mig.zip -d /var/www/html/wordpress/wp-content/plugins/
COPY wordpress-bkp.tar.gz /var/www/html/
RUN tar xf /var/www/html/wordpress-bkp.tar.gz -C /var/www/html/
COPY backup.sql /tmp/

ADD entrypoint.sh /usr/local/sbin/
ADD wordpress.conf /etc/apache2/sites-available/
#ADD wp-config.php /var/www/html/wordpress/

RUN a2dissite 000-default
RUN a2ensite wordpress
RUN a2enmod rewrite

ENTRYPOINT ["entrypoint.sh"]
#CMD ["entripoint.sh"]
CMD ["/bin/bash"]

EXPOSE 80
