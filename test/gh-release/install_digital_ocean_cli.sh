#!/bin/bash

set -e

source dev-container-features-test-lib


check "doctl version" doctl version


reportResults
