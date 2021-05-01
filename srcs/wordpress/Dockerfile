FROM	alpine:3.13.5

LABEL version="1.0"
LABEL description="wordpress server"
EXPOSE 5050
RUN apk update\
	&&	apk add --no-cache\
			openrc\
			nginx\
			mysql-client\
			unzip\	
			php7\
			php7-mysqlnd\
			php7-fpm\
			php7-mbstring\
			php7-mysqli\
			php7-iconv\
			php7-xml\
			php7-json\
			php7-session\
			php7-phar\
			curl\
			telegraf
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh /tmp/install.sh
RUN /tmp/install.sh
CMD [ "/tmp/init.sh" ]
