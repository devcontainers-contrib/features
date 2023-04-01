#!/usr/bin/env bash
set -ex

PACKAGE=${PACKAGE:-""}
VERSION=${VERSION:-"latest"}
INSTALLATION_FLAGS=${INSTALLATION_FLAGS:-""}

if [ -z "$PACKAGE" ]; then
	echo -e "'package' variable is empty, skipping"
	exit 0
fi

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as 
    root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

ensure_curl () {
    if ! type curl >/dev/null 2>&1; then
        apt-get update -y && apt-get -y install --no-install-recommends curl ca-certificates
    fi 
}


install_via_homebrew() {
	package=$1
	version=$2
	installation_flags=$3

	# install Homebrew if does not exists
	if ! type brew >/dev/null 2>&1; then
		echo "Installing Homebrew..."
		
		ensure_curl
		curl -sSL -o dcontainer "https://github.com/devcontainers-contrib/cli/releases/download/v0.1.3/dcontainer"
		chmod +x dcontainer
		./dcontainer feature install "ghcr.io/meaningful-ooo/devcontainer-features/homebrew:2.0.3" --option shallow_clone="true" --option update="true" 
		source /etc/profile
		rm -f ./devcontainer
	fi
	

	if [ "$version" = "latest" ]; then
		package_full="$package"
	else
		package_full="${package}@${version}"
	fi
	# Solves CVE-2022-24767 mitigation in Git >2.35.2 
	# For more information: https://github.blog/2022-04-12-git-security-vulnerability-announced/
	git config --system --add safe.directory "$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core"		

	su - "$_REMOTE_USER" <<EOF
		set -e

		if brew desc --eval-all --formulae "$package_full"; then
			# If a version is exists then install it the regular way
			brew install $installation_flags --overwrite "$package_full" 
		else
			# unshallow and extract as last resort
			echo "Unshallowing homebrew-core. This could take a while."
			git -C "$(brew --prefix)/Homebrew/Library/Taps/homebrew/homebrew-core" fetch --unshallow
			brew extract --force --version="$version" "$package" homebrew/cask
			
			# "--overwrite" in order to not fail when a similarly named binary is already linked
			brew install $installation_flags --overwrite "$package_full"  
			
			# attempt to remove tap in order to save disk space
			set +e
			brew untap homebrew/cask --force
			set -e
		fi

		brew link --overwrite --force "$package_full" 
EOF
}

install_via_homebrew "$PACKAGE" "$VERSION" "$INSTALLATION_FLAGS" 
