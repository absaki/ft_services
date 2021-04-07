#!bin/ash

#SSL
# mkdir /etc/nginx/ssl
# openssl req -newkey rsa:4096 -x509 -sha256 -days 1000 -nodes -out /etc/nginx/ssl/server.pem\
# 		-keyout /etc/nginx/ssl/server.key\
# 		-subj "/C=JP/ST=Tokyo/L=Minato/O=42Tokyo/OU=kikeda/CN=localhost"

# NGINX
adduser -D -g 'www' www
mkdir -p /run/nginx
mkdir -p /var/www/html
chown -R www:www /var/www
mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf.original
cp /tmp/nginx_top.conf /etc/nginx/http.d/
cp /tmp/index.html /var/www/html/index.html

# START SERVER
nginx -g 'daemon off;'