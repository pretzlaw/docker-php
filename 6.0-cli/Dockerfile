FROM debian:jessie
MAINTAINER Mike Pretzlaw <mail@mike-pretzlaw.de>
WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        make build-essential autoconf libicu-dev \
        git \
        wget

#
# PHP
#

# Some Apache modules need to be linked
RUN apt-get install -y --no-install-recommends apache2-bin apache2.2-common apache2-dev

# Bison parser
# ./configure checks for the bison version
# bison versions supported for regeneration of the Zend/PHP parsers:
# 1.28 1.35 1.75 1.875 2.0 2.1 2.2 2.3 2.4 2.4.1
RUN wget https://ftp.gnu.org/gnu/bison/bison-2.4.1.tar.gz && \
    tar xzf bison-2.4.1.tar.gz && \
    cd bison-2.4.1 && \
    ./configure && \
    make -j "$(nproc)" && \
    make install && \
    cd .. && \
    rm -rf bison-2.4.1*

# XML
RUN wget ftp://xmlsoft.org/libxml2/libxml2-2.8.0.tar.gz && \
    tar xzf libxml2-2.8.0.tar.gz && \
    cd libxml2-2.8.0 && \
    ./configure && \
    make -j "$(nproc)" && \
    make install && \
    cd .. && \
    rm -rf libxml2-2.8.0*

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
# Clean up
#
RUN rm -rf /var/lib/apt/lists/*
