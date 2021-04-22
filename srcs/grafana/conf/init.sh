#!bin/ash

telegraf &
/usr/share/grafana-7.5.4/bin/grafana-server --config /usr/share/grafana-7.5.4/conf/grafana.ini  --homepath=/usr/share/grafana-7.5.4/