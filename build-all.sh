#!/usr/bin/env bash

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

buildOrder=(
    5.3-fpm
    5.3-apache
    5.4-cli
    5.4-fpm
    5.4-apache
    5.5-cli
    5.5-fpm
    5.5-apache
    5.6-cli
    5.6-fpm
    5.6-apache
    6.0-cli
    6.0-apache
    7.0-cli
    7.0-fpm
    7.0-apache
    7.1-cli
    7.1-fpm
    7.1-apache
)

if [[ ! -d ${baseDir}/log ]]; then
    mkdir ${baseDir}/log
fi

for tag in ${buildOrder[*]}; do
    cd ${baseDir}/${tag}
    imageName=pretzlaw/php:${tag}
    docker build -t ${imageName} . 2>&1 | tee ${baseDir}/log/php_${tag}.log

    if [[ "0" != "$?" ]]; then
        continue;
    fi

    docker push ${imageName}
done
