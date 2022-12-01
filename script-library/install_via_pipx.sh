#!/usr/bin/env bash

install_via_pipx() {
    # This is part of devcontainers-contrib script library
    # source: https://github.com/devcontainers-contrib/features/tree/v1.0.1/script-library
    PACKAGES=("$@")
    arraylength="${#PACKAGES[@]}"

    env_name=$(echo ${PACKAGES[0]} | cut -d "=" -f 1 | cut -d "<" -f 1 | cut -d ">" -f 1 )

    # if no python - install it
    if ! dpkg -s python3-minimal python3-pip libffi-dev python3-venv > /dev/null 2>&1; then
        apt-get update -y
        apt-get -y install python3-minimal python3-pip libffi-dev python3-venv
    fi
    export PIPX_HOME=/usr/local/pipx
    mkdir -p ${PIPX_HOME}
    export PIPX_BIN_DIR=/usr/local/bin
    export PYTHONUSERBASE=/tmp/pip-tmp
    export PIP_CACHE_DIR=/tmp/pip-tmp/cache
    pipx_bin=pipx
    # if pipx not exists - install it
    if ! type pipx > /dev/null 2>&1; then
        pip3 install --disable-pip-version-check --no-cache-dir --user pipx
        pipx_bin=/tmp/pip-tmp/bin/pipx
    fi
    # install main package
    ${pipx_bin} install --pip-args '--no-cache-dir --force-reinstall' -f "${PACKAGES[0]}"
    # install injections (if provided)
    for (( i=1; i<${arraylength}; i++ ));
    do
    ${pipx_bin} inject $env_name --pip-args '--no-cache-dir --force-reinstall' -f "${PACKAGES[$i]}"
    done

    # cleaning pipx to save disk space
    rm -rf /tmp/pip-tmp
}