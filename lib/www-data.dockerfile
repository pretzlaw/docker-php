### Special modifications for the www-data user.

RUN groupadd -og 999 docker && usermod -a -G docker www-data

# Add www-data environment (for SSH mostly)
RUN sed -i 's/\#umask 022/umask 002/' /etc/skel/.profile
RUN usermod -d /home/www-data -s /bin/bash www-data \
    && cp -av /etc/skel /home/www-data \
    && mv /var/www /home/www-data/www \
    && ln -s /home/www-data/www /var/www \
    && chown -R www-data:www-data /home/www-data
