#!bin/ash
mkdir /run/openrc
mkdir /run/mysqld
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysqld -u root &
sleep 5;
echo "create database wpdb;" | mysql
echo "create user 'wpadmin' identified by 'wpadmin';" | mysql
echo "grant all privileges on wpdb.* to wpadmin@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
telegraf &
tail -f /dev/null