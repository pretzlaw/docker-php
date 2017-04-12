# Objectives of this repo

Hopefully we keep this up:

- Have most of the current used PHP versions here.
- Have it as Apache, CLI and FPM (e.g. for nginx).
- It should be possible to SSH in each container.
- Each container should be able ot send mails via relay.

By that they are ready for your own dockerized hosting ;-)

# Setup

## Docker

## docker-compose

Simple as that:

    version: '3'
    services:
      php:
        image: pretzlaw/php:5.3-apache
        
        # Mount your project / data in "/var/www/html" (document root)
        # or "/var/www" if you have a more complex setup.
        volumes:
          - ".:/var/www/html"
          
        # Make it accessible via http://127.0.0.1:8000
        ports:
          - "8000:80"

Exchange the image name by one of the following tags.

# Supported tags and respective Dockerfile links

Use one of these:

- `php:5.3-apache` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.3-apache)
- `php:5.3-fpm` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.3-fpm)
- `php:5.4-apache` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.4-apache)
- `php:5.4-cli` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.4-cli)
- `php:5.4-fpm` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.3-fpm)
- `php:5.5-apache` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.5-apache)
- `php:5.5-cli` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.5-cli)
- `php:5.5-fpm` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.5-fpm)
- `php:5.6-apache` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.6-apache)
- `php:5.6-cli` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.6-cli)
- `php:5.6-fpm` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.6-fpm)
- `php:7.0-apache` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-apache)
- `php:7.0-cli` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-cli)
- `php:7.0-fpm` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-fpm)
- `php:7.1-apache` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-apache)
- `php:7.1-cli` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-cli)
- `php:7.1-fpm` [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-fpm)


# Meta

## Like to contribute or found a problem?

Please leave a message in the issue tracker:
https://github.com/pretzlaw/docker-php/issues

Or a simple comment below.
