#!/bin/bash
set -e
sha1()
{
        head -c1M /dev/urandom | sha1sum | cut -d' ' -f1
}
stopall()
{
        echo "Stopping container.."
        /etc/init.d/apache2 stop
        /etc/init.d/mysql stop
        pkill tail
        exit
}

chown -R www-data:www-data /var/www/html/
#usermod -d /var/lib/mysql/ mysql
echo "Starting container.."
#/etc/init.d/mysql start
/etc/init.d/apache2 start

#trap stopall SIGINT SIGTERM

tail -f /var/log/apache2/*.log &
wait
