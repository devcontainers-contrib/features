#!/bin/bash -e

echo "Testing global scenarios"
devcontainer features test --global-scenarios-only .

if [[ -z $1 ]]; do
  for id in test/*; do
    if [[ -f $id ]]; then
      continue
    fi

    id="$(basename "$id")"

    echo "Testing $id..."
    devcontainer features test -f "$id" .
    echo "Done! Passed! $id"
  done
else
  echo "Testing ONLY $1"
  devcontainer features test -f "$1" .
fi
