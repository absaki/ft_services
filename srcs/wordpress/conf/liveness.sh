#!/bin/ash
if [ `pgrep nginx | wc -l` -eq 0 ]; then
    exit 1
fi
if [ `pgrep php-fpm | wc -l` -eq 0 ]; then
    exit 2
fi
if [ `pgrep telegraf | wc -l` -eq 0 ]; then
    exit 3
fi
exit 0