#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "kubescape version" kubescape version

reportResults
