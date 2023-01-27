#!/bin/bash
set -e

for id in src/*; do
  if [[ -f $id ]]; then
    continue
  fi

  id="$(basename "$id")"

  rsync -av bash_modules/ "src/$id/bash_modules/"
done
