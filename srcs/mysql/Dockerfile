FROM	alpine:latest

LABEL version="1.0"
LABEL description="mysql server"
EXPOSE 3306
RUN apk update\
	&&	apk add --no-cache\
			openrc\
			mysql\
			mysql-client\
			mariadb-openrc
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh /tmp/install.sh
RUN ./tmp/install.sh
CMD [ "/tmp/init.sh" ]
