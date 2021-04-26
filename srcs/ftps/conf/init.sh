#!/bin/ash
mkdir -p /etc/ftps/wpadmin
adduser --home=/etc/ftps/wpadmin -D wpadmin
echo "wpadmin:wpadmin" | chpasswd
echo "wpadmin" > /etc/vsftpd/vsftpd.userlist
telegraf &
chmod -R 777 /etc/ftps/wpadmin
vsftpd /etc/vsftpd/vsftpd.conf