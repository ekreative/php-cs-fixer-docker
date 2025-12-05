#!/usr/bin/env bash
set -e

# https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases

declare -A variants=(
  ['3']='3.89.0'
  ['3.89']='3.89.0'
)

declare -A php_version=(
  ['3']='8.4'
  ['3.89']='8.4'
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
