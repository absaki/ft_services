#!/bin/ash

adduser -D -g 'nginx' nginx

# MySQL
mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf.original
cp /tmp/mariadb-server.cnf /etc/my.cnf.d/
