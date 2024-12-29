#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "scala --version" scala --version

reportResults
