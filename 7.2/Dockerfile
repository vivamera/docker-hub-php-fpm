FROM php:7.2-fpm-alpine

ENV XDEBUG_VERSION 2.6.0

# Install build dependencies
RUN apk add --no-cache --virtual .build-deps \
    ${PHPIZE_DEPS} \
    icu-dev \
    postgresql-dev

# Build
RUN set -xe \
    && docker-php-ext-install \
        bcmath \
        intl \
        pdo_pgsql \
    && pecl install \
        redis \
        xdebug-"${XDEBUG_VERSION}" \
    && docker-php-ext-enable \
        redis

# Install persistent deps and remove uninstall build deps
RUN apk add --no-cache --virtual .persistent-deps \
    $( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
        | tr ',' '\n' \
        | sort -u \
        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    ) \
    && apk del .build-deps
