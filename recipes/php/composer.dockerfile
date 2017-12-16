# Install composer
RUN apt-get install -qqy curl unzip \
    && wget https://getcomposer.org/download/1.5.5/composer.phar -q -O /usr/local/bin/composer > /dev/null \
    && chmod a+rx /usr/local/bin/composer \
    && composer self-update > /dev/null
