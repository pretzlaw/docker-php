ENV HTTPD_CONF_DIR /etc/apache2/conf-enabled/
ENV HTTPD__DocumentRoot /var/www/html
ENV HTTPD__LogFormat '"%a %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" common'

RUN sed -i "s/DocumentRoot.*/DocumentRoot \${HTTPD__DocumentRoot}/"  /etc/apache2/apache2.conf && \
    echo 'ServerName ${HOSTNAME}' > $HTTPD_CONF_DIR/00-default.conf && \
    echo 'ServerSignature Off' > /etc/apache2/conf-enabled/z-security.conf && \
    echo 'ServerTokens Minimal' >> /etc/apache2/conf-enabled/z-security.conf && \
    chmod a+w -R $HTTPD_CONF_DIR/ /etc/apache2/mods-enabled $PHP_INI_DIR/ && \
    rm /etc/apache2/sites-enabled/000-default.conf

