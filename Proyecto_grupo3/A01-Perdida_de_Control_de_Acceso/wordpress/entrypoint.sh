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

chown -R www-data:www-data /var/www/html/wordpress
usermod -d /var/lib/mysql/ mysql
echo "Starting container.."
/etc/init.d/mysql start
/etc/init.d/apache2 start

#trap stopall SIGINT SIGTERM

echo "create database"
mysql -e "CREATE DATABASE wordpress /*\!40100 DEFAULT CHARACTER SET utf8 */;"
echo "create user"
mysql -e "CREATE USER 'wordpress'@'%' IDENTIFIED BY 'wpassword';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';"
mysql -e "FLUSH PRIVILEGES;"

cd /tmp
echo "restore database"
mysql -u root wordpress < backup.sql

tail -f /var/log/apache2/*.log &
wait
