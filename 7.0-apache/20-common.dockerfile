ENV LOCALTIME Europe/Berlin
WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]

RUN apt install -y \
    curl \
    unzip \
    wget

# Mostly common packages
RUN apt install -y \
    libicu-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev
RUN docker-php-ext-install bcmath \
    && docker-php-ext-install curl \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install xml
RUN apt install -y libzip-dev \
    && docker-php-ext-install zip

# Add www-data environment (for SSH mostly)
RUN sed -i 's/\#umask 022/umask 002/' /etc/skel/.profile
RUN usermod -d /home/www-data -s /bin/bash www-data \
    && cp -av /etc/skel /home/www-data \
    && mv /var/www /home/www-data/www \
    && ln -s /home/www-data/www /var/www \
    && chown -R www-data:www-data /home/www-data