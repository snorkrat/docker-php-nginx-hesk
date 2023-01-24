#!/bin/bash

PUID=${PUID:-911}
PGID=${PGID:-911}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

echo "
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-------------------------------------
"
chown abc:abc /var/www/html
chown abc:abc /hesk

mv -n /hesk/* /var/www/html/

exec tail -f /dev/null