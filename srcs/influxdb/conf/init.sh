#!bin/ash

influxd &
echo "create database telegraf" | influx
telegraf &
/usr/share/grafana-7.5.4/bin/grafana-server --config /usr/share/grafana-7.5.4/conf/sample.ini  --homepath=/usr/share/grafana-7.5.4/
