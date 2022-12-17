#!/bin/bash

set -e

source dev-container-features-test-lib

check 'dpkg -l | grep "ii  cowsay"' dpkg -l | grep "ii  cowsay"
check 'dpkg -l | grep "ii  build-essential"' dpkg -l | grep "ii  build-essential"


reportResults
