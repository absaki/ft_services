#!bin/ash

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