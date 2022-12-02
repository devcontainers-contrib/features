#!/bin/bash -e
#shellcheck source=../../bash_modules/,pipx.sh
source bash_modules/,pipx.sh

if [[ $VERSION == latest ]]; then
	,pipx install bikeshed
elif [[ $VERSION =~ ^[0-9] ]]; then
	,pipx install "bikeshed==$VERSION"
else
	,pipx install "bikeshed$VERSION"
fi
bikeshed update
