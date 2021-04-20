FROM	alpine:latest

LABEL version="1.0"
LABEL description="ftps server"

RUN apk update\
	&&	apk add --no-cache\
			openrc\
            vsftpd
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh /tmp/install.sh\
    && /tmp/install.sh
CMD [ "/tmp/init.sh" ]
EXPOSE 21
EXPOSE 20
EXPOSE 21009-21011