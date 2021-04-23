#!bin/ash
mv /tmp/WordPress-master/* /var/www/html/
mv /tmp/wp-config.php /var/www/html/
chown -R nginx:nginx /var/www
php-fpm7
rc-service php-fpm7 start
telegraf &
nginx -g 'daemon off;'
