#!bin/ash

php-fpm7
rc-service php-fpm7 start
nginx -g 'daemon off;'
