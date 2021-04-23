#!/bin/ash

#vsftpd
rm /etc/vsftpd/vsftpd.conf
mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Telegraf
mkdir /etc/telegraf
mv /tmp/telegraf.conf /etc/telegraf/telegraf.conf
