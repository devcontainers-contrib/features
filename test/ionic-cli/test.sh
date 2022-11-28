#!/bin/bash

set -e

source dev-container-features-test-lib

check "ionic --help" ionic --help

reportResults
