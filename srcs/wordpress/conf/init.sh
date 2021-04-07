#!bin/ash

# PHP-FPM
rm /etc/php7/php-fpm.d/www.conf
mv /tmp/www.conf /etc/php7/php-fpm.d/www.conf
php-fpm7
rc-service php-fpm7 start

# NGINX
adduser -D -g 'www' www
mkdir -p /run/nginx
mkdir -p /var/www/html
chown -R www:www /var/www
mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf.original
cp /tmp/nginx_top.conf /etc/nginx/http.d/
cp /tmp/index.html /var/www/html/index.html
cp /tmp/phpinfo.php /var/www/html/phpinfo.php

# START SERVER
nginx -g 'daemon off;'