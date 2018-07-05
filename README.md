# PHP FPM
[![Build Status](https://travis-ci.com/vivamera/docker-hub-php-fpm.svg?branch=master)](https://travis-ci.com/vivamera/docker-hub-php-fpm) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/b654009dc2e140839bb6ae5620942810)](https://www.codacy.com/app/vivamera/docker-hub-php-fpm?utm_source=github.com&utm_medium=referral&utm_content=vivamera/docker-hub-php-fpm&utm_campaign=Badge_Grade) 

This is a image for `PHP FPM` witch is based upon `php fpm alpine`.

This image provides the following extensions:
- bcmath
- intl
- pdo_pgsql
- xdebug

The image provides configuration for:
- [php](https://github.com/vivamera/docker-hub-php-fpm/tree/master/7.2/etc/php)
- [php-fpm](https://github.com/vivamera/docker-hub-php-fpm/tree/master/7.2/etc/php-fpm.d)

## Supported tags and respective Dockerfile links
* `7.2`, `latest` [(7.2/Dockerfile)](https://github.com/vivamera/docker-hub-php-fpm/blob/master/7.2/Dockerfile)

## How to use this image
Running an instance:

```bash
$ docker run \
    --name vivamera-php-fpm \
    --volume "$(pwd)":/app \
    --publish "80:80" \
    --detach \
    vivamera/php-fpm
``` 

Then you can hit http://localhost or http://host-ip in your browser.

You might want to access the logs from xdebug so you might use the following:

```bash
$ docker run \
    --name vivamera-php-fpm \
    --volume "$(pwd)":/app \
    --volume "$(pwd)/log/xdebug":/var/log/xdebug \
    --publish "80:80" \
    --detach \
    vivamera/php-fpm
```

To additionally use communication using sockets use the following:

```bash
$ docker run \
    --name vivamera-php-fpm \
    --volume "$(pwd)":/app \
    --volume sock:/sock \
    --volume "$(pwd)/log/xdebug":/var/log/xdebug \
    --publish "80:80" \
    --detach \
    vivamera/php-fpm
```

This image will be shipped with `xdebug` installed but not enabled. If you want to use xdebug add the environment `USE_XDEBUG` with an boolean value.

```bash
$ docker run \
    --name vivamera-php-fpm \
    --env USE_XDEBUG=1 \
    --volume "$(pwd)":/app \
    --volume sock:/sock \
    --volume "$(pwd)/log/xdebug":/var/log/xdebug \
    --publish "80:80" \
    --detach \
    vivamera/php-fpm
```

## Quick reference
* **Where to get help:**
[the Docker Community Forums](https://forums.docker.com), [the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack), or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

* **Where to file issues:**
https://github.com/vivamera/docker-hub-php-fpm/issues

* **Maintained by:**
[The VIVAMERA Team](https://github.com/vivamera)

* **Source of this description:**
[Repository README.md](https://github.com/vivamera/docker-hub-php-fpm/blob/master/README.md)
