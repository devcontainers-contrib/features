#!/bin/bash

set -e

source dev-container-features-test-lib

check "poetry --version" poetry --version

reportResults
