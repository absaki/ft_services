FROM	alpine:latest

LABEL version="1.0"
LABEL description="wordpress server"
EXPOSE 80
RUN apk update\
	&&	apk add --no-cache\
			openrc\
			nginx\
			openssl\
			php7\
			php7-mysqlnd\
			php7-fpm\
			php7-mbstring\
			mariadb-server-utils\
			curl
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh
CMD [ "/tmp/init.sh" ]
