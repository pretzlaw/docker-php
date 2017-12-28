#!/usr/bin/env bash

baseDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${baseDir}/.env

if [[ ! -d ${baseDir}/log ]]; then
    mkdir ${baseDir}/log
fi

for tag in ${buildOrder[*]}; do
    cd ${baseDir}/${tag}
    imageName=pretzlaw/php:${tag}
    logFile="${baseDir}/log/php_${tag}.log"

    if [[ -x $tag/tests.sh ]]; then
        $tag/tests.sh || continue;
    fi

    if [[ ! -f $logFile ]]; then
        # We do not push failed/incomplete container.
        continue;
    fi

    docker push ${imageName}
done
