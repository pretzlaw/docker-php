#!/usr/bin/env bash

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${baseDir}/.env

if [[ ! -d ${baseDir}/log ]]; then
    mkdir ${baseDir}/log
fi

if [[ ! -z "$1" ]]; then
    # Specific build requested, so only this will be used
    buildOrder=($1)
fi

for tag in ${buildOrder[*]}; do
    cd ${baseDir}/${tag}
    imageName=pretzlaw/php:${tag}
    logFile="${baseDir}/log/php_${tag}.log"

    if [[ -x ./tests.sh ]]; then
        ./tests.sh || continue;
    fi

    if [[ ! -f $logFile ]]; then
        # We do not push failed/incomplete container.
        continue;
    fi

    docker push ${imageName}
done
