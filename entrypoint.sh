#!/bin/bash

# Add custom subdir
CONFIG_SUBDIR='html/'$SUBDIR
mkdir -p /home/easyphp/$CONFIG_SUBDIR
CONFIG_SUBDIR=${CONFIG_SUBDIR//\//\\\/}
CONFIG_FILE=/home/easyphp/httpd.conf
sed -i "s/MAIN_DIR/$CONFIG_SUBDIR/g" $CONFIG_FILE
echo "Changed to s/MAIN_DIR/$CONFIG_SUBDIR/g"


# Start Apache HTTP Server
apachectl -DFOREGROUND