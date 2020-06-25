#!/usr/bin/env bash

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$baseDir/../test-functions.sh"

# 20-common.dockerfile
__apt-has curl unzip wget
__php-module bcmath curl intl mbstring xml zip

# 70-php-db.dockerfile
__php-module pdo_mysql mysqli pdo_sqlite

# 70-php-gd.dockerfile
__php-module gd

# 70-php-other.dockerfile
__php-module sockets

# 80-composer.dockerfile
__can-exec composer