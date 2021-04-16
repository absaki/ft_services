FROM	alpine:latest

LABEL version="1.0"
LABEL description="wordpress server"
EXPOSE 80
RUN apk update\
	&&	apk add --no-cache\
			openrc\
			nginx\
			curl
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh /tmp/install.sh
RUN /tmp/install.sh
CMD [ "/tmp/init.sh" ]
