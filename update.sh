#!/usr/bin/env bash
set -e

# https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases
declare -A variants=(
  ['3']='3.57.2'
  ['3.57']='3.57.2'
)

declare -A php_version=(
  ['3']='8.3'
  ['3.57']='8.3'
)

for variant in "${!variants[@]}"; do
  template="Dockerfile.template"
  dir="$variant"
  rm -rf "$dir"
  mkdir -p "$dir"

  extraSed=''
  sed -E '
    '"$extraSed"'
    s/%%VARIANT%%/'"${variants[$variant]}"'/;
    s/%%PHP_VERSION%%/'"${php_version[$variant]}"'/;
  ' "$template" >"$dir/Dockerfile"
done
