# Php-cs-fixer docker image

Image used for running cs fixer on our ci server

## Tags available

- `3.89`, `3`, `latest` (PHP-CS-Fixer 3.89.0 on PHP 8.4)

## Unmaintained tags

- `3.57` (PHP-CS-Fixer 3.57.2 on PHP 8.3)
- `3.13`
- `3.12`
- `3.9`
- `3.8`
- `2.19`, `2`
- `1`

## Build command

```shell
docker build -t ekreative/php-cs-fixer .
```

## Build an app

```shell
docker run -ti --rm --volume=$(pwd):/srv -w /srv ekreative/php-cs-fixer
```
