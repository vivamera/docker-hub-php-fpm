FROM php:7.2-fpm-alpine3.8

ENV XDEBUG_VERSION 2.6.1

# Install phpize build dependencies
# hadolint ignore=SC2086,DL3018
RUN apk add --no-cache --virtual .phpize-build-deps \
    ${PHPIZE_DEPS}

# Install build dependencies
RUN apk add --no-cache --virtual .build-deps \
    bash=4.4.19-r1 \
    icu-dev=60.2-r2 \
    postgresql-dev=10.5-r0 \
    zlib-dev=1.2.11-r1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Build
RUN set -xe \
    && docker-php-ext-install \
        bcmath \
        intl \
        pdo_pgsql \
    && pecl install \
        grpc \
        redis \
        xdebug-"${XDEBUG_VERSION}" \
    && docker-php-ext-enable \
        grpc \
        redis

# Install persistant library dependencies
# hadolint ignore=SC2046,DL3018
RUN apk add --no-cache --virtual .persistent-lib-deps \
    $( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
        | tr ',' '\n' \
        | sort -u \
        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )

# Remove build dependencies
RUN apk del --purge .phpize-build-deps .build-deps
