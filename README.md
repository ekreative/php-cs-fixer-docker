# Php-cs-fixer docker image

Image used for running cs fixer on our ci server

## Tags available

* `3.8`, `3` `latest`
* `3.8`
* `3.7`
* `3.6`
* `3.5`
* `3.4`
* `3.3`
* `3.2`
* `3.1`
* `3.0`
* `2.19`, `2`
* `1`

## Build command

    docker build -t ekreative/php-cs-fixer .

## Build an app

    docker run -ti --rm --volume=$(pwd):/srv -w /srv ekreative/php-cs-fixer
