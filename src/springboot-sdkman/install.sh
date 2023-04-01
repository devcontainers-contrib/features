#!/bin/bash -i

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers/features/java:1.1.1" \
    --option jdkDistro="$JDKDISTRO" --option version="$JDKVERSION"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/ebaskoro/devcontainer-features/sdkman:1.0.0" \
    --option candidate="springboot" --option version="$VERSION"


echo 'Done!'

