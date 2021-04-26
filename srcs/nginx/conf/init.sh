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
mv /etc/nginx/http.d/default.conf /etc/nginx/http.d/default.conf.original
cp /tmp/nginx_top.conf /etc/nginx/http.d/
rmdir /var/www/html
mv /tmp/public /var/www/html
chmod -R 755 /var/www/html
chown -R www:www /var/www
sed -i -e "s/WPPORT/$WPPORT/g" /etc/nginx/http.d/nginx_top.conf
sed -i -e "s/PMAPORT/$PMAPORT/g" /etc/nginx/http.d/nginx_top.conf

# TELEGRAF
telegraf &

# START SERVER
nginx -g 'daemon off;'