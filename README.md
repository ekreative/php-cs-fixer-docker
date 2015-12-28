# Php docker image

Image used for running php tests on our ci server

## Build command

    docker build -t ekreative/php .

## Build an app

    docker run -ti --rm --volume=$(pwd):/opt/workspace ekreative/php ./bin/phpunit
