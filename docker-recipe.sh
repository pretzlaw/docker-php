#!/usr/bin/env bash

for templateName in "${@}" clean; do
    eval "echo \"$(cat recipes/${templateName}.dockerfile | sed 's/\\/\\\\/g' | sed 's/"/\\"/g' )\""
    echo ""
done
