FROM php:5.4-apache
MAINTAINER Mike Pretzlaw <mail@mike-pretzlaw.de>

# See https://github.com/docker-library/php/tree/fec7f537f049aafd2102202519c3ca9cb9576707/5.4

ENV HTTPD_CONF_DIR /etc/apache2/conf-enabled/
ENV HTTPD__DocumentRoot /var/www/html
ENV HTTPD__LogFormat '"%a %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" common'

RUN sed -i "s/DocumentRoot.*/DocumentRoot \${HTTPD__DocumentRoot}/"  /etc/apache2/apache2.conf && \
    echo 'ServerName ${HOSTNAME}' > $HTTPD_CONF_DIR/00-default.conf && \
    chmod a+w -R $HTTPD_CONF_DIR/ /etc/apache2/mods-enabled/ $PHP_INI_DIR/

COPY docker-entrypoint.sh /entrypoint.sh
