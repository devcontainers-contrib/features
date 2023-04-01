#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "kscript --help" kscript --help

reportResults
