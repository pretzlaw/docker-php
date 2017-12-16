#!/usr/bin/env bash

TAG=7.2-cli
TARGET=$TAG/Dockerfile
IMAGE=php:7.2-zts
source docker-recipe.sh base php/composer vcs > ${TARGET}

cp entrypoint.sh $TAG/entrypoint.sh
