#!/usr/bin/env bash
set -e

# https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases
declare -A variants=(
  ['2']='2.16.5'
  ['2.16']='2.16.5'
  ['2.15']='2.15.9'
  ['1']='1.13.2'
)

for variant in "${!variants[@]}"; do
  template="Dockerfile.template"
  dir="$variant"
  rm -rf "$dir"
  mkdir -p "$dir"

  extraSed=''
  if [ "$variant" = "1" ]; then
    extraSed='
      '"$extraSed"'
      /##<verify>##/,/##<\/verify>##/d;
    '
  fi
  sed -E '
    '"$extraSed"'
    s/%%VARIANT%%/'"${variants[$variant]}"'/;
  ' $template >"$dir/Dockerfile"
done
