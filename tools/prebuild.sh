#!/bin/bash
set -e

for id in src/*; do
  if [[ -f $id ]]; then
    continue
  fi

  id="$(basename "$id")"

  rm -rf "src/$id/bash_modules"
  cp -r bash_modules "src/$id/bash_modules"
done
