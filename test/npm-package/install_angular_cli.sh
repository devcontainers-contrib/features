#!/bin/bash

set -e

source dev-container-features-test-lib

check "list --short | grep black" list --short | grep black


reportResults
