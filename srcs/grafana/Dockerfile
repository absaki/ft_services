FROM	alpine:3.13.5

LABEL version="1.0"
LABEL description="grafana server"
EXPOSE 3000
RUN apk update\
	&&	apk add --no-cache\
			openrc\
			libc6-compat\
			telegraf
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh /tmp/install.sh
RUN ./tmp/install.sh
CMD [ "/tmp/init.sh" ]
