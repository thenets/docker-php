#!/bin/bash

set -x

# Add custom subdir
CONFIG_SUBDIR='html/'$SUBDIR
mkdir -p /app/$CONFIG_SUBDIR
CONFIG_SUBDIR=${CONFIG_SUBDIR//\//\\\/}
CONFIG_FILE=/app/httpd.conf
sed -i "s/MAIN_DIR/$CONFIG_SUBDIR/g" $CONFIG_FILE
echo "Changed to s/MAIN_DIR/$CONFIG_SUBDIR/g"

# Start Apache HTTP Server
/usr/sbin/httpd -DFOREGROUND