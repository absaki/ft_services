#!bin/ash

php-fpm7
rc-service php-fpm7 start
telegraf &
nginx -g 'daemon off;'
