#!/bin/bash

set -e

source dev-container-features-test-lib

check "racket --version" racket --version

reportResults
