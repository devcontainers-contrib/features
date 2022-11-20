#!/bin/bash

set -e

source dev-container-features-test-lib

check "mocha --version" mocha --version

reportResults