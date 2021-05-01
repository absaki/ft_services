#!/bin/ash

# Telegraf
mkdir /etc/telegraf
mv /tmp/telegraf.conf /etc/telegraf/telegraf.conf

# LivenessProbe
chmod +x /tmp/liveness.sh
