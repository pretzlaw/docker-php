FROM php:7.2-apache
MAINTAINER Pretzlaw <mail@rmp-up.de>

COPY 7.1-apache/entrypoint.sh /entrypoint.sh
CMD ["apache2-foreground"]