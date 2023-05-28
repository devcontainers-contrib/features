#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type joern-parse && type joern-flow && type joern-scan && type joern-export" type joern-parse && type joern-flow && type joern-scan && type joern-export

reportResults
