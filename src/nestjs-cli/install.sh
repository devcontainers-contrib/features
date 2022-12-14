#!/usr/bin/env bash
#-------------------------------------------------------------------------------------------------------------
# This code was generated by the DevContainers Feature Cookiecutter
# Docs: https://github.com/devcontainers-contrib/features/tree/main/pkgs/feature-template#readme
#-------------------------------------------------------------------------------------------------------------

set -e

# npm version for @nestjs/cli
NESTJS_CLI=${VERSION:-"latest"}

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as 
    root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

check_packages() {
	# This is part of devcontainers-contrib script library
	# source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

install_via_npm() {
	# This is part of devcontainers-contrib script library
	# source: https://github.com/devcontainers-contrib/features/tree/v1.1.8/script-library
	PACKAGE=$1

	# install node+npm if does not exists
	if ! type npm >/dev/null 2>&1; then
		echo "Installing node and npm..."
		check_packages curl
		curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | $SHELL
		export NVM_DIR=/usr/local/share/nvm
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
		[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
	fi
	npm install -g --omit=dev $PACKAGE
}

if [ "$NESTJS_CLI" != "none" ]; then
	if [ "$NESTJS_CLI" = "latest" ]; then
		npm_package="@nestjs/cli"
	else
		npm_package="@nestjs/cli@$NESTJS_CLI"
	fi
	install_via_npm ${npm_package}
fi

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
