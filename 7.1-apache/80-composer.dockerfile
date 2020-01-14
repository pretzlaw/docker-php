# PHP composer
RUN EXPECTED_SIGNATURE="$(wget --quiet -O - https://composer.github.io/installer.sig)" \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")" \
    && test '"$EXPECTED_SIGNATURE" == "$ACTUAL_SIGNATURE"' \
    && php composer-setup.php --quiet \
    && rm composer-setup.php \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer