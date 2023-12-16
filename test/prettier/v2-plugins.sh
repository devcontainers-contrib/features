#!/bin/bash

set -e

source dev-container-features-test-lib

check "prettier --version = 2.8.8" [ "$(prettier --version)" = "2.8.8" ]

for p in php ruby xml; do
  plugin="@prettier/plugin-${p}"
  check "npm list --parseable --depth 0  | grep ${plugin}" npm list --parseable --depth 0 | grep "${plugin}"
done

reportResults
