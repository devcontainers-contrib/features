#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jreleaser --version" jreleaser --version

reportResults
