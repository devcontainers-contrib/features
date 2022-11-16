#!/bin/bash

set -e

source dev-container-features-test-lib

check "flake8 --version" flake8 --version

reportResults