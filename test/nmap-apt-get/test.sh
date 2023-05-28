#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "nmap --version" nmap --version

reportResults
