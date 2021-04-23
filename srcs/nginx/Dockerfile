FROM	alpine:3.13.5

LABEL version="1.0"
LABEL description="nginx server"

RUN apk update\
	&&	apk add --no-cache\
			openrc\
			nginx\
			openssl\
			telegraf
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh /tmp/install.sh
RUN /tmp/install.sh
CMD [ "/tmp/init.sh" ]
EXPOSE 80
EXPOSE 443
EXPOSE 22
