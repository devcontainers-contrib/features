#!/bin/bash

set -e

source dev-container-features-test-lib

check "putup --version" putup --version

reportResults
