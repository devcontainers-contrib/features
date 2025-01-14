#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# The releases of Kitware/CMake are prefixed with a 'v' character
# So if it's not the latest version, we need to add it
if [ "${VERSION}" != "latest" ]; then
    VERSION="v${VERSION}"
fi

# Install cmake via GitHub Release feature
$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/gh-release:1.0.25" \
    --option repo='Kitware/CMake' --option binaryNames='cmake,ctest,cpack' \
    --option libName='cmake' --option assetRegex='.*tar.gz$' \
    --option version="${VERSION}"

echo 'Done!'
