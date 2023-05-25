#!/bin/bash

set -e

source dev-container-features-test-lib
ls /usr/local/python -l
check "pipx list --short | grep black" pipx list --short | grep "black"


reportResults
