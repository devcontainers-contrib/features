#!/bin/bash -i

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.4.45"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/npm-package:1.0.3" \
    --option package='prettier' --option version="$VERSION"
    

PRETTIER_PLUGINS=${PLUGINS:-""}

setup_npm() {
    export NVM_DIR=/usr/local/share/nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

install_prettier_plugin() {
    echo "Installing prettier plugin - $1"
    if ! npm list $1 >/dev/null; then
        npm install --save-dev prettier $1
    fi
}

# Prettier plugins are expected to be installed locally, not globally
# In particular, VSCode + extensions tend to have issues with this
if [ -n "${PRETTIER_PLUGINS}" ]; then
    if ! type npm >/dev/null 2>&1; then
        setup_npm
    fi

    OIFS=$IFS
    IFS=','
    for plugin in $PRETTIER_PLUGINS; do
        install_prettier_plugin $plugin
    done
    IFS=$OIFS
fi



echo 'Done!'

