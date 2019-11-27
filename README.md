# Php-cs-fixer docker image

Image used for running cs fixer on our ci server

## Tags available

* `2.16`, `2`, `latest`
* `2.15`
* `1`

## Build command

    docker build -t ekreative/php-cs-fixer .

## Build an app

    docker run -ti --rm --volume=$(pwd):/srv -w /srv ekreative/php-cs-fixer
