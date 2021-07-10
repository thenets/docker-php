FROM alpine:3.7

MAINTAINER Luiz Felipe F M Costa <luiz@thenets.org>

ENV APP_DIR=/app
ENV HTML_DIR=$APP_DIR/html/

# Install packages
RUN set -x && \
    # Install main packages
    apk add --no-cache git tar zip unzip bash make curl && \
    # Install PHP7 and dependencies
    PHP_MODULES=$(apk search --no-cache php7 | grep "^php" | grep -E "([A-Za-z ]*)-([A-Za-z ]*)-([A-Za-z ]*)" | cut -d '-' -f 1,2) && \
    apk add --no-cache php7 $PHP_MODULES && \
    # Install Composer
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    # Install Apache HTTP Server
    apk add --no-cache apache2 apache2-utils php7-apache2

# Add user with dir at /app
RUN set -x \
    # Add 'php' user
    adduser -D -u 1000 php -h $APP_DIR

# Config and volume
USER root
WORKDIR $HTML_DIR
ADD ./entrypoint.sh /entrypoint.sh
ADD ./httpd.conf $APP_DIR/
ENTRYPOINT /entrypoint.sh
EXPOSE 80 443
#VOLUME [$APP_DIR]
