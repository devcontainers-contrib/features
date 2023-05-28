#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "toolkit --help" toolkit --help

reportResults
