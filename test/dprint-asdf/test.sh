#!/bin/bash

set -e

source dev-container-features-test-lib

check "dprint --version" dprint --version

reportResults
