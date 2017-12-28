#!/usr/bin/env bash

DOCKER_IMAGE=pretzlaw/php:7.2-apache

source "$( cd "$(dirname "$0")" ; pwd -P )"/../test-functions.sh

__docker_run "composer self-update | grep 'You are already using composer version'"

__docker_run "php -m | grep ctype"
#__docker_run "php -m | grep curl"
#__docker_run "php -m | grep date"
#__docker_run "php -m | grep dom"
#__docker_run "php -m | grep fileinfo"
#__docker_run "php -m | grep filter"
#__docker_run "php -m | grep ftp"
#__docker_run "php -m | grep hash"
#__docker_run "php -m | grep iconv"
#__docker_run "php -m | grep json"
#__docker_run "php -m | grep libxml"
#__docker_run "php -m | grep mbstring"
#__docker_run "php -m | grep mysqlnd"
#__docker_run "php -m | grep openssl"
#__docker_run "php -m | grep pcre"
#__docker_run "php -m | grep PDO"
#__docker_run "php -m | grep pdo_sqlite"
#__docker_run "php -m | grep Phar"
#__docker_run "php -m | grep posix"
#__docker_run "php -m | grep readline"
#__docker_run "php -m | grep Reflection"
#__docker_run "php -m | grep session"
#__docker_run "php -m | grep SimpleXML"
#__docker_run "php -m | grep SPL"
#__docker_run "php -m | grep sqlite3"
#__docker_run "php -m | grep standard"
#__docker_run "php -m | grep tokenizer"
#__docker_run "php -m | grep xml"
#__docker_run "php -m | grep xmlreader"
#__docker_run "php -m | grep xmlwriter"
#__docker_run "php -m | grep zlib"
