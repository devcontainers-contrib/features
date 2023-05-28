#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cookiecutter --version" cookiecutter --version

reportResults
