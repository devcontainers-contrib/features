#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "n8n --version" n8n --version

reportResults
