FROM php:7.0-apache
MAINTAINER Pretzlaw <mail@rmp-up.de>

COPY 7.0-apache/entrypoint.sh /entrypoint.sh
CMD ["apache2-foreground"]