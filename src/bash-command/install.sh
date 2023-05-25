#!/usr/bin/env bash

COMMAND="${COMMAND:-""}"

set -ex

# Clean up
rm -rf /var/lib/apt/lists/*

bash -c "${COMMAND}"

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
