FROM php:8-alpine

ENV PHP_CS_FIXER_VERISON 2.18.7
# hadolint ignore=DL3018
RUN curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v$PHP_CS_FIXER_VERISON/php-cs-fixer.phar -o php-cs-fixer \
    && chmod +x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer

CMD ["/usr/local/bin/php-cs-fixer", "fix"]
