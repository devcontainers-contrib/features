#!/bin/bash

set -e

source dev-container-features-test-lib

# TODO: Configure some zsh plugins and check them here
check "zsh --version" zsh --version

reportResults
