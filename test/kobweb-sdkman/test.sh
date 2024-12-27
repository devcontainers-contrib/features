#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "kobweb --version" kobweb --version

reportResults
