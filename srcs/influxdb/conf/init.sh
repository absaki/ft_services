#!bin/ash

influxd &
echo "create database telegraf" | influx
telegraf