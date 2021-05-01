#!/bin/ash
if [ `pgrep vsftpd| wc -l` -eq 0 ]; then
    exit 1
fi
if [ `pgrep telegraf | wc -l` -eq 0 ]; then
    exit 3
fi
exit 0