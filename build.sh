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

# Common problem after cloning
find ./* -name "*.sh" -exec chmod +x {} \;

for configDir in ${buildOrder[*]}; do
    tag=$(basename "${configDir}")

    logFile="${baseDir}/log/${tag}.log"
    :>$logFile

    # Merge *.dockerfile
    for f in "$configDir"/*.dockerfile; do (cat "${f}"; echo); done > "$configDir"/Dockerfile

    imageName=pretzlaw/php:${tag}
    echo $imageName
    docker build --no-cache --pull -t "${imageName}" -f "$configDir"/Dockerfile . | tee ${baseDir}/log/php_${tag}.log
    echo ""

    rm "$configDir"/Dockerfile
done

ls *.err 2>/dev/null
