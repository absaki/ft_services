#!/bin/ash
mkdir -p /etc/ftps/wpadmin
adduser --home=/etc/ftps/wpadmin -D wpadmin
echo "wpadmin:wpadmin" | chpasswd
echo "wpadmin" > /etc/vsftpd/vsftpd.userlist
vsftpd /etc/vsftpd/vsftpd.conf