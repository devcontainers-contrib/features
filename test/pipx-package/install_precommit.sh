#!/bin/bash

set -e

source dev-container-features-test-lib

check "pipx list --short | grep pre-commit" pipx list --short | grep "pre-commit"

check "type pre-commit"  type pre-commit

reportResults
