#!/bin/bash

PUID=${PUID:-911}
PGID=${PGID:-911}
INSTALL_DIR=${INSTALL_DIR:-0}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc

echo "
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-------------------------------------
"
chown abc:abc /var/www/html
chown abc:abc /hesk

if [[ $INSTALL_DIR -eq 0 ]]; then
echo "Removing Install DIR before copy"
rm -rf /hesk/install
fi

mv -n /hesk/* /var/www/html/

rm -rf /hesk

echo "Removing Install DIR from web root"
rm -rf /var/www/html/install


exec tail -f /dev/null