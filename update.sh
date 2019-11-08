#!/usr/bin/env bash
set -e

# https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases
declare -A variants=(
  ['2']='2.16.0'
	['2.16']='2.16.0'
	['2.15']='2.15.0'
	['1']='1.13.2'
)

for variant in "${!variants[@]}"; do
  template="Dockerfile.template"
  dir="$variant"
  rm -rf "$dir"
  mkdir -p "$dir"
  sed -E '
    s/%%VARIANT%%/'"${variants[$variant]}"'/;
  ' $template > "$dir/Dockerfile"
done
