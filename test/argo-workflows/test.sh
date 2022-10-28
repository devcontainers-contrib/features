#!/bin/bash

set -e

source dev-container-features-test-lib

check "argo workflows cli" argo version

reportResults