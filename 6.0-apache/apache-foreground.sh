#!/bin/bash
set -e

: "${APACHE_CONFDIR:=/etc/apache2}"
: "${APACHE_ENVVARS:=$APACHE_CONFDIR/envvars}"

if [ -f "$APACHE_ENVVARS" ]; then
	. "$APACHE_ENVVARS"
fi

# Apache gets grumpy about PID files pre-existing
: "${APACHE_PID_FILE:=${APACHE_RUN_DIR:=/var/run/apache2}/apache2.pid}"
rm -f "$APACHE_PID_FILE"

exec apache2 -DFOREGROUND "$@"
