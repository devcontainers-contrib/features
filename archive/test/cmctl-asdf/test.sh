#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cmctl --help" cmctl --help

reportResults
