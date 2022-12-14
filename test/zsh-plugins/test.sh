#!/bin/bash

set -e

source dev-container-features-test-lib

check "zsh --version" zsh --version

reportResults
