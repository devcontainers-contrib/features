#!/bin/bash

set -e

source dev-container-features-test-lib

check "elm --version" elm --version

reportResults
