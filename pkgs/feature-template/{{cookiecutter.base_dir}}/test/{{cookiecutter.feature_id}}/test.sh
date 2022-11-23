#!/bin/bash

set -e

source dev-container-features-test-lib

check "{{cookiecutter.test_command}}" {{cookiecutter.test_command}}

reportResults