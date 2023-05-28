#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ansible --version | grep 'core 2.13.0'" ansible --version | grep 'core 2.13.0'

reportResults
