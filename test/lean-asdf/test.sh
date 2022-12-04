#!/bin/bash

set -e

source dev-container-features-test-lib

check "lean --version" lean --version

reportResults
