#!/bin/bash

set -e

source dev-container-features-test-lib

check "fkill --version" fkill --version

reportResults