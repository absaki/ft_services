#!bin/ash

# PHP-FPM
rm /etc/php7/php-fpm.d/www.conf
mv /tmp/www.conf /etc/php7/php-fpm.d/www.conf

# NGINX
adduser -D -g 'nginx' nginx
mkdir -p /run/nginx
mkdir -p /var/www/html
mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf.original
cp /tmp/nginx_top.conf /etc/nginx/http.d/
cp /tmp/index.html /var/www/html/index.html
cp /tmp/phpinfo.php /var/www/html/phpinfo.php

# WordPress
curl -Lk4o /tmp/wordpress.zip https://github.com/WordPress/WordPress/archive/refs/heads/master.zip
unzip /tmp/wordpress.zip -d /tmp/
curl -Lk4O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Telegraf
mkdir /etc/telegraf
mv /tmp/telegraf.conf /etc/telegraf/telegraf.conf

# LivenessProbe
chmod +x /tmp/liveness.sh
