#!bin/ash
mv /tmp/WordPress-master/* /var/www/html/
chown -R nginx:nginx /var/www
php-fpm7
rc-service php-fpm7 start
telegraf &
sleep 3
wp config create --path='/var/www/html' --dbname='wpdb' --dbuser='wpadmin' --dbpass='wpadmin' --dbhost='mysql'
wp core install --path='/var/www/html' --url='192.168.49.42:5050' --title='ft_services blog' --admin_user='wpadmin' --admin_password='wpadmin' --admin_email='wpadmin@localhost.com'
sleep 3
wp user create wpuser wpuser@localhost.com --role=editor --user_pass=wpuser --path='/var/www/html'
touch /ready
nginx -g 'daemon off;'
