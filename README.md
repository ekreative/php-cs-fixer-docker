# Php-cs-fixer docker image

Image used for running cs fixer on our ci server

## Tags available

* `3.0`, `3` `latest`
* `2.19`, `2`
* `2.18`
* `2.17`
* `2.16`
* `2.15`
* `1`

## Build command

    docker build -t ekreative/php-cs-fixer .

## Build an app

    docker run -ti --rm --volume=$(pwd):/srv -w /srv ekreative/php-cs-fixer
