The repo https://hub.docker.com/r/pretzlaw/php/
holds the compiled container of https://github.com/pretzlaw/docker-php .

# Objectives of this repo

Hopefully we keep this up:

- Have most of the current used PHP versions here.
- Have it as Apache, CLI and FPM (e.g. for nginx).
- It should be possible to SSH in each container.

Ready and set for your own dockerized development workflow ;-)

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

### Example

Here is a more complete example what you might want to do in your projects:

```yaml
version: '3'

services:
  php:
    image: pretzlaw/php:7.1-apache
    volumes:
    - ".:/var/www/html"
    environment:
      LOCALTIME: Europe/Paris

      # Apache configuration (HTTPD__ prefix)
      HTTPD__DocumentRoot: /var/www/html

      # Install via PECL
      pecl_install: redis

      # PHP config (PHP__ prefix)
      PHP__memory_limit: 512M
      PHP__session.save_path: /var/www/html

      # Enable modules
      PHP_php5enmod: >
        gd
        intl
        mysqli
        xdebug
```

# Supported tags and respective Dockerfile links

Use one of these:

- `pretzlaw/php:5.3-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.3-apache)
- `pretzlaw/php:5.3-fpm`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.3-fpm)
- `pretzlaw/php:5.4-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.4-apache)
- `pretzlaw/php:5.4-cli`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.4-cli)
- `pretzlaw/php:5.4-fpm`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.3-fpm)
- `pretzlaw/php:5.5-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.5-apache)
- `pretzlaw/php:5.5-cli`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.5-cli)
- `pretzlaw/php:5.5-fpm`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.5-fpm)
- `pretzlaw/php:5.6-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.6-apache)
- `pretzlaw/php:5.6-cli`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.6-cli)
- `pretzlaw/php:5.6-fpm`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/5.6-fpm)
- `pretzlaw/php:7.0-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-apache)
- `pretzlaw/php:7.0-fpm`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.0-fpm)
- `pretzlaw/php:7.1-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.1-apache)
- `pretzlaw/php:7.1-fpm`     [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.1-fpm)
- `pretzlaw/php:7.2-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.2-apache)
- `pretzlaw/php:7.3-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.3-apache)
- `pretzlaw/php:7.4-apache`  [Dockerfile](https://github.com/pretzlaw/docker-php/tree/master/7.4-apache)

[Also available on DockerHub!](https://hub.docker.com/r/pretzlaw/php)

# Meta

## Like to contribute or found a problem?

Please leave a message in the issue tracker:
https://github.com/pretzlaw/docker-php/issues

Or a simple comment below.
