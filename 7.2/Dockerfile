FROM php:7.2-fpm-alpine

ENV XDEBUG_VERSION="2.6.0"

RUN apk add --no-cache --virtual .build-deps \
    ${PHPIZE_DEPS}

# Install persistent dependencies
RUN apk add --no-cache --virtual .persistent-deps \
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
        redis \
    && apk del .build-deps

COPY etc/php/conf.d/* "${PHP_INI_DIR}"/conf.d/
COPY etc/php/php.ini "${PHP_INI_DIR}"/
COPY etc/php-fpm.d/zz-docker.conf "${PHP_INI_DIR}"/../php-fpm.d/zz-docker.conf

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

CMD [ "php-fpm" ]
