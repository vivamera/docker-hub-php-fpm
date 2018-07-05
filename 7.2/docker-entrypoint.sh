#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

if [ -n "${USE_XDEBUG}" ]; then
    echo "zend_extension=xdebug.so" > "${PHP_INI_DIR}"/conf.d/docker-php-ext-xdebug.ini
fi

exec "$@"
