#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "lefthook --help" lefthook --help

reportResults
