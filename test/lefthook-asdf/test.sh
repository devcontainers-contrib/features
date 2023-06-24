#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "lefthook-asdf --help" lefthook-asdf --help

reportResults
