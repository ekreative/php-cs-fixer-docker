FROM php:7-cli

MAINTAINER Fred Cox "mcfedr@gmail.com"

RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        libicu-dev \
        libxslt-dev \
        zlib1g-dev \
        curl \
        git

RUN docker-php-ext-install mcrypt intl mbstring pdo_mysql pcntl xsl zip

ENV PHP_REDIS_VERSION php7
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/${PHP_REDIS_VERSION}.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-${PHP_REDIS_VERSION} /usr/src/php/ext/redis \
    && docker-php-ext-install redis

RUN touch /usr/local/etc/php/conf.d/pecl.ini \
    && pear config-set php_ini /usr/local/etc/php/conf.d/pecl.ini \
    && pecl config-set php_ini /usr/local/etc/php/conf.d/pecl.ini \
    && pecl install -o -f xdebug-2.4.0RC3 apcu \
    && rm -rf /tmp/pear \
    && sed -i.bak '/^extension="xdebug.so"$/d' /usr/local/etc/php/conf.d/pecl.ini

RUN echo "date.timezone=UTC" > /usr/local/etc/php/conf.d/timezone.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace
