#!/bin/bash

set -e

source dev-container-features-test-lib

check "vue --help" vue --help

reportResults