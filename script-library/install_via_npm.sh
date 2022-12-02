#!/usr/bin/env bash

install_via_npm() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.1.7/script-library
    PACKAGE=$1
    
    # install node+npm if does not exists
    if ! type npm >/dev/null 2>&1; then
        echo "Installing node and npm..."
        if ! dpkg -s "$@" > /dev/null 2>&1; then
            if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            echo "Running apt-get update..."
            apt-get update -y
            fi
            apt-get -y install --no-install-recommends "$@"
        fi

        curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | $SHELL
        export NVM_DIR=/usr/local/share/nvm
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    fi
    npm install -g --omit=dev $PACKAGE
}
