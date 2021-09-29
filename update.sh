#!/usr/bin/env bash
set -e

# https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases
declare -A variants=(
  ['3']='3.1.0'
  ['3.1']='3.1.0'
  ['3.0']='3.0.3'
  ['2']='2.19.0'
  ['2.19']='2.19.0'
  ['2.18']='2.18.7'
  ['2.17']='2.17.5'
  ['2.16']='2.16.10'
  ['2.15']='2.15.10'
  ['1']='1.13.3'
)

declare -A php_version=(
  ['3']='8'
  ['3.1']='8'
  ['3.0']='8'
  ['2']='8'
  ['2.19']='8'
  ['2.18']='8'
  ['2.17']='7'
  ['2.16']='7'
  ['2.15']='7'
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
