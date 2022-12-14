#!/bin/bash

set -e

source dev-container-features-test-lib

check "terraform --version" terraform --version

reportResults
