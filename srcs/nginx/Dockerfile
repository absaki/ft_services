FROM	alpine:latest

LABEL version="1.0"
LABEL description="nginx server"

RUN apk update\
	&&	apk add --no-cache\
			openrc\
			nginx\
			openssl
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh
CMD [ "/tmp/init.sh" ]
EXPOSE 80
EXPOSE 443
EXPOSE 22
