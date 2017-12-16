#!/usr/bin/env bash

function docker_php_recipe() {
    TAG=$1
    [[ -d $TAG ]] || mkdir $TAG
    shift

    TARGET=$TAG/Dockerfile
    IMAGE=$1
    shift

    source docker-recipe.sh ${@} > ${TARGET}

    cp entrypoint.sh $TAG/entrypoint.sh
}

docker_php_recipe 7.2-cli php:7.2-zts base php/composer vcs
docker_php_recipe 7.2-apache php:7.2-apache base php/composer vcs
