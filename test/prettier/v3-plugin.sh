#!/bin/bash

set -e

source dev-container-features-test-lib

check "prettier --version = 3.0.0" [ "$(prettier --version)" = "3.0.0" ]

check "npm list --parseable --depth 0  | grep prettier-plugin-ini" npm list --parseable --depth 0 | grep "prettier-plugin-ini"

reportResults
