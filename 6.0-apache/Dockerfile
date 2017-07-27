FROM debian:jessie
MAINTAINER Mike Pretzlaw <mail@mike-pretzlaw.de>

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        wget

#
# PHP
#

# Bison parser
RUN wget https://ftp.gnu.org/gnu/bison/bison-2.4.1.tar.gz && \
    tar xzf bison-2.4.1.tar.gz && \
    cd bison-2.4.1 && \
    ./configure && \
    make -j "$(nproc)" && \
    make install && \
    cd .. && \
    rm -rf bison-2.4.1 bison-2.4.1.tar.gz

# XML
RUN wget ftp://xmlsoft.org/libxml2/libxml2-2.8.0.tar.gz && \
    tar xzf libxml2-2.8.0.tar.gz && \
    cd libxml2-2.8.0 && \
    ./configure && \
    make -j "$(nproc)" && \
    make install && \
    cd .. && \
    rm -rf libxml2-2.8.0 libxml2-2.8.0.tar.gz

# Compile PHP 6.0
RUN git clone -b experimental/first_unicode_implementation https://github.com/php/php-src.git && \
    cd php-src && \
    ./buildconf && \
    ./configure --with-apxs2 && \
    make -j "$(nproc)" && \
    make install && \
    cd .. && \
    rm -rf php-src

#
# Apache2
#

# Allow override of variables
RUN sed -ri 's/^export ([^=]+)=(.*)$/: ${\1:=\2}\nexport \1/' "/etc/apache2/envvars" && \

# docker-like stdout
RUN set -ex \
	&& . "/etc/apache2/envvars" \
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
WORKDIR /var/www/html
CMD ["apache2-foreground"]

#
# Clean up
#
RUN rm -rf /var/lib/apt/lists/*
