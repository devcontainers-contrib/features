#shellcheck shell=bash

function ,curl() {
	command -v curl || install_curl
	curl "$@"
}

function install_curl() {
	source bash_modules/,apt-get.sh

	rm -f /etc/ssl/certs/ca-bundle.crt
	,apt-get install ca-certificates
	update-ca-certificates
	,apt-get install curl
}
