#!/usr/bin/env bash

trap __docker_test_exit EXIT

ERRORS=
function __docker_run() {
    eval docker run -t ${DOCKER_IMAGE} "${@}" 2>&1 >/dev/null

    if [[ "$?" == "0" ]]; then
        echo -n "."
    else
        echo -n "F"
        ERRORS="$ERRORS\n- ${@}"
    fi
}

function __docker_test_exit() {
    # create a newline
    echo ""

    if [[ "$ERRORS" != "" ]]; then
        echo $ERRORS
        exit 1
    fi
}
