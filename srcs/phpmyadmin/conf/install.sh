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

# PHPMyAdmin
curl -o /tmp/phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.zip
unzip -d /tmp /tmp/phpmyadmin.zip
mkdir /var/www/html/phpmyadmin
cp -pR /tmp/phpMyAdmin-5.1.0-all-languages/* /var/www/html/phpmyadmin
sed -i s/localhost/mysql/ /var/www/html/phpmyadmin/libraries/config.default.php

chown -R nginx:nginx /var/www
