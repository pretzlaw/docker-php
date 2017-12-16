#!/usr/bin/env bash

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${baseDir}/.env

if [[ ! -d ${baseDir}/log ]]; then
    mkdir ${baseDir}/log
fi

source scaffold.sh

if [[ ! -z "$1" ]]; then
    buildOrder=($1)
fi

for tag in ${buildOrder[*]}; do
    logFile="${baseDir}/log/php_${tag}.log"
    :>$logFile

    cd ${baseDir}/${tag}
    imageName=pretzlaw/php:${tag}
    docker build --no-cache -t ${imageName} . 2>&1 | tee ${baseDir}/log/php_${tag}.log
    echo ""
done

ls *.err 2>/dev/null
