#!/bin/ash

mkdir /etc/telegraf
mv /tmp/telegraf.conf /etc/telegraf/telegraf.conf
cd /usr/share
wget https://dl.grafana.com/oss/release/grafana-7.5.4.linux-amd64.tar.gz
tar -zxvf grafana-7.5.4.linux-amd64.tar.gz
mkdir /conf
cp /usr/share/grafana-7.5.4/conf/defaults.ini /conf/
cp /tmp/grafana.ini /usr/share/grafana-7.5.4/conf/grafana.ini
cp /tmp/datasource.yaml /usr/share/grafana-7.5.4/conf/provisioning/datasources/
cp /tmp/dashboard.yaml /usr/share/grafana-7.5.4/conf/provisioning/dashboards/
mkdir /usr/share/grafana-7.5.4/dashboards
cp /tmp/dashboard.json /usr/share/grafana-7.5.4/dashboards/

# LivenessProbe
chmod +x /tmp/liveness.sh
