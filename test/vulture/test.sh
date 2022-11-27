#!/bin/bash

set -e

source dev-container-features-test-lib

check "vulture --version" vulture --version

reportResults
