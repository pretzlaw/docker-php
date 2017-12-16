FROM php:7.2-zts
MAINTAINER Mike Pretzlaw <mail@mike-pretzlaw.de>

WORKDIR /var/www

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# update
RUN apt-get update \
    && apt-get install -qqy man \
    && apt-get upgrade -qy

# basics
RUN apt-get install -qqy curl unzip vim wget

# Install composer
RUN apt-get install -qqy curl unzip \
    && wget https://getcomposer.org/download/1.5.5/composer.phar -q -O /usr/local/bin/composer > /dev/null \
    && chmod a+rx /usr/local/bin/composer \
    && composer self-update > /dev/null

# Install VCS
RUN apt-get install -qqy git subversion

# cleanup
RUN rm -rf /var/lib/apt/lists/*

