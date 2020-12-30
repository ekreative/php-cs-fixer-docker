FROM php:7-alpine

ENV PHP_CS_FIXER_VERISON 2.15.10
# hadolint ignore=DL3018
RUN curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v$PHP_CS_FIXER_VERISON/php-cs-fixer.phar -o php-cs-fixer \
##<verify>##
    && curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v$PHP_CS_FIXER_VERISON/php-cs-fixer.phar.asc -o php-cs-fixer.phar.asc \
    && apk add --no-cache --virtual .build-deps gnupg \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-key BBAB5DF0A0D6672989CF1869E82B2FB314E9906E \
    && gpg --verify php-cs-fixer.phar.asc php-cs-fixer \
    && apk del .build-deps \
##</verify>##
    && chmod +x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer

CMD ["/usr/local/bin/php-cs-fixer", "fix"]
