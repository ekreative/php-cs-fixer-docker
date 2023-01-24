#!/usr/bin/env bash
set -e

# https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases
declare -A variants=(
  ['3']='3.13.2'
  ['3.13']='3.13.2'
  ['3.12']='3.12.0'
  ['2']='2.19.3'
  ['2.19']='2.19.3'
  ['1']='1.13.3'
)

declare -A php_version=(
  ['3']='8.0'
  ['3.13']='8.1'
  ['3.12']='8.1'
  ['2']='8.0'
  ['2.19']='8.0'
  ['1']='7.1'
)

for variant in "${!variants[@]}"; do
  template="Dockerfile.template"
  dir="$variant"
  rm -rf "$dir"
  mkdir -p "$dir"

  extraSed=''
  #  if [ "$variant" = "1" ]; then
  extraSed='
      '"$extraSed"'
      /##<verify>##/,/##<\/verify>##/d;
    '
  #  fi
  sed -E '
    '"$extraSed"'
    s/%%VARIANT%%/'"${variants[$variant]}"'/;
    s/%%PHP_VERSION%%/'"${php_version[$variant]}"'/;
  ' $template >"$dir/Dockerfile"
done
