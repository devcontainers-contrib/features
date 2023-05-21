#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "porter --version" porter --version

check "porter mixin list | grep terraform" porter mixin list | grep terraform

check "porter mixin list | grep az" porter mixin list | grep az

check "porter mixin list | grep aws" porter mixin list | grep aws

check "porter mixin list | grep docker" porter mixin list | grep docker

check "porter mixin list | grep docker-compose" porter mixin list | grep docker-compose

check "porter mixin list | grep gcloud" porter mixin list | grep gcloud

check "porter mixin list | grep helm" porter mixin list | grep helm

check "porter mixin list | grep arm" porter mixin list | grep arm

check "porter plugin list | grep azure" porter plugin list | grep azure

check "porter plugin list | grep kubernetes" porter plugin list | grep kubernetes

reportResults
