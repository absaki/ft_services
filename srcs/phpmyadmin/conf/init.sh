#!bin/ash

mkdir /run/openrc
mkdir /run/mysqld
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysqld -u root & > /dev/null

# START SERVER
php-fpm7
rc-service php-fpm7 start
sleep 3
echo "create database wpdb;" | mysql -u root --skip-password
echo "create user 'wpadmin'@'localhost' identified by 'wpadmin';" | mysql -u root --skip-password
echo "grant all on wpdb.* to 'wpadmin'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
nginx -g 'daemon off;'
