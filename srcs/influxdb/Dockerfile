FROM	alpine:3.13.5

LABEL version="1.0"
LABEL description="influxdb server"
EXPOSE 8086
EXPOSE 3000
RUN apk update\
	&&	apk add --no-cache\
			openrc\
			libc6-compat\
			influxdb\
			telegraf
COPY conf/ /tmp/
RUN chmod 744 /tmp/init.sh /tmp/install.sh
RUN ./tmp/install.sh
CMD [ "/tmp/init.sh" ]
