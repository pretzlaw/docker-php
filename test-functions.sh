#!/usr/bin/env bash

trap __docker_test_exit EXIT

ERRORS=""
function __docker_test() {
    # eval needed to allow pipes
    if eval "docker run -t ${DOCKER_IMAGE} ${*} 2>&1 >/dev/null"; then
        echo -n "."
    else
        echo -n "F"
        ERRORS="$ERRORS\n- ${*}"
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

function __apt-has() {
  for package in "$@"; do
    __docker_test dpkg -s $package
  done
}

function __php-module() {
  for module in "$@"; do
    __docker_test "php -m | grep $module"
  done
}
