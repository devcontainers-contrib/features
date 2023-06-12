#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "linkerd --help" linkerd --help

reportResults
