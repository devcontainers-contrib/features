#!/bin/bash

set -e

source dev-container-features-test-lib

check "packer --version" packer --version

reportResults
