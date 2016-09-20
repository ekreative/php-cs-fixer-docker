FROM php:7-cli

MAINTAINER Fred Cox "mcfedr@gmail.com"

RUN curl -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v1.12.1/php-cs-fixer.phar -o php-cs-fixer \
    && chmod +x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer

CMD ["/usr/local/bin/php-cs-fixer", "fix"]
