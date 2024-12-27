#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sqlfmt --version" sqlfmt --version

reportResults
