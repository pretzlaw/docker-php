FROM pretzlaw/php:6.0-cli
MAINTAINER Mike Pretzlaw <mail@mike-pretzlaw.de>
WORKDIR /var/www/html

# Allow override of variables
RUN sed -ri 's/^export ([^=]+)=(.*)$/: ${\1:=\2}\nexport \1/' "/etc/apache2/envvars"

# docker-like stdout
RUN set -ex && . "/etc/apache2/envvars" \
    && ln -sfT /dev/stderr "$APACHE_LOG_DIR/error.log" \
    && ln -sfT /dev/stdout "$APACHE_LOG_DIR/access.log" \
    && ln -sfT /dev/stdout "$APACHE_LOG_DIR/other_vhosts_access.log"

# Apache-Hotfix for permissions
RUN . "/etc/apache2/envvars" && \
    for D in \
        "$APACHE_LOCK_DIR" \
        "$APACHE_RUN_DIR" \
        "$APACHE_LOG_DIR" \
        /var/www/html \
    ; do \
        rm -rvf "$D" \
        && mkdir -p "$D" \
        && chown -R "$APACHE_RUN_USER:$APACHE_RUN_GROUP" "$D"; \
    done

RUN a2dismod mpm_event && a2enmod mpm_prefork

# PHP files should be handled by PHP, and should be preferred over any other file type
RUN { \
        echo '<FilesMatch \.php$>'; \
        echo '\tSetHandler application/x-httpd-php'; \
        echo '</FilesMatch>'; \
        echo; \
        echo 'DirectoryIndex disabled'; \
        echo 'DirectoryIndex index.php index.html'; \
        echo; \
        echo '<Directory /var/www/>'; \
        echo '\tOptions -Indexes'; \
        echo '\tAllowOverride All'; \
        echo '</Directory>'; \
    } | tee "/etc/apache2/conf-available/docker-php.conf" && \
    a2enconf docker-php

COPY apache2-foreground.sh /usr/local/bin/apache2-foreground

EXPOSE 80
CMD ["apache2-foreground"]

#
# Clean up
#
RUN rm -rf /var/lib/apt/lists/*
