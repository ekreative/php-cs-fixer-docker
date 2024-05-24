# Php-cs-fixer docker image

Image used for running cs fixer on our ci server

## Tags available

- `3.57`, `3` `latest`

## Unmaintained tags

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
