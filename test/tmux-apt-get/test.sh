#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "tmux -V" tmux -V

reportResults
