#!/usr/bin/env bash

set -ex

pwd
shfmt -l -w ./src/{{ cookiecutter.feature_id }}/install.sh

shfmt -l -w ./test/{{ cookiecutter.feature_id }}/test.sh