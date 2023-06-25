#!/bin/bash

set -e

source dev-container-features-test-lib

check "pipx list --short | grep black" pipx list --short | grep "black"


reportResults
