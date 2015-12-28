FROM php:5-cli

MAINTAINER Fred Cox "mcfedr@gmail.com"

RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        libicu-dev \
        libxslt-dev \
        zlib1g-dev \
        curl \
        git

RUN docker-php-ext-install mcrypt intl mbstring pdo_mysql pcntl xsl zip

#ENV PHP_REDIS_VERSION 2.2.7
#RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/${PHP_REDIS_VERSION}.tar.gz \
#    && tar xfz /tmp/redis.tar.gz \
#    && rm -r /tmp/redis.tar.gz \
#    && mv phpredis-${PHP_REDIS_VERSION} /usr/src/php/ext/redis \
#    && docker-php-ext-install redis

RUN pecl install -o -f redis xdebug apcu-4.0.10 \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini

#RUN echo "y\ny" | pecl install apcu-beta \
#    && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini

RUN echo "date.timezone=UTC" > /usr/local/etc/php/conf.d/timezone.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace
