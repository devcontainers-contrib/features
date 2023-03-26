#!/bin/bash -i

GH_RELEASE_REPO=${REPO:-""}
GH_RELEASE_TARGET=${TARGET:-""}
GH_RELEASE_VERSION=${VERSION:-""}

set -e


if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as
    root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi



ensure_curl() {
    # Ensure curl available
    if ! type curl >/dev/null 2>&1; then
        apt-get update -y && apt-get -y install --no-install-recommends curl ca-certificates
    fi 
}


ensure_git() {
    # Ensure curl available
    if ! type git >/dev/null 2>&1; then
        apt-get update -y && apt-get -y install --no-install-recommends git
    fi 
}

ensure_dcontainer() {
    # Ensure existance of the dcontainer cli program
    local variable_name=$1
    local dcontainer_location=""

    # If possible - try to use an already installed dcontainer
    if [[ -z "${DCONTAINER_FORCE_CLI_INSTALLATION}" ]]; then
        if [[ -z "${DCONTAINER_CLI_LOCATION}" ]]; then
            if type dcontainer >/dev/null 2>&1; then
                echo "Using a pre-existing dcontainer"
                dcontainer_location=dcontainer
            fi
        elif [ -f "${DCONTAINER_CLI_LOCATION}" ] && [ -x "${DCONTAINER_CLI_LOCATION}" ] ; then
            echo "Using a pre-existing dcontainer which were given in env varialbe"
            dcontainer_location=${DCONTAINER_CLI_LOCATION}
        fi
    fi

    # If not previuse installation found, download it temporarly and delete at the end of the script 
    if [[ -z "${dcontainer_location}" ]]; then

        if [ "$(uname -sm)" == "Linux x86_64" ] || [ "$(uname -sm)" == "Linux aarch64" ]; then
            tmp_dir=$(mktemp -d -t dcontainer-XXXXXXXXXX)

            clean_up () {
                ARG=$?
                rm -rf $tmp_dir
                exit $ARG
            }
            trap clean_up EXIT

            curl -sSL https://github.com/devcontainers-contrib/cli/releases/download/v0.3.4/dcontainer-"$(uname -m)"-unknown-linux-gnu.tgz | tar xfzv - -C "$tmp_dir"
            chmod a+x $tmp_dir/dcontainer
            dcontainer_location=$tmp_dir/dcontainer
           
        else
            echo "No binaries compiled for non-x86-linux architectures yet, such as ARM and Apple silicon. Therefore we fallback to python based installation."
            exit 1
        fi
    fi

    # Expose outside the resolved location
    declare -g ${variable_name}=$dcontainer_location

}

ensure_curl
ensure_git
ensure_dcontainer dcontainer_location

if [ -z "$GH_RELEASE_REPO" ]; then
	echo -e "'repo' variable is empty, skipping"
	exit 0
fi

if [ -z "$GH_RELEASE_TARGET" ]; then
	echo -e "'target' variable is empty, skipping"
	exit 0
fi

$dcontainer_location \
    install \
    gh-release \
    "$GH_RELEASE_REPO" \
    "$GH_RELEASE_TARGET" \
    --version "$GH_RELEASE_VERSION"
