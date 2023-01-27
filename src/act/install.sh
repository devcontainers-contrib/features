#!/bin/bash -e

source bash_modules/get_latest_release.sh
source bash_modules/ensure_curl.sh

uname_sm="$(uname -sm)"
uname_sm="${uname_sm// /_}"
tag=""
if [[ $VERSION == "latest" ]]; then
  tag="$(get_latest_release nektos/act)"
else
  tag="v$VERSION"
fi
url="https://github.com/nektos/act/releases/download/$tag/act_$uname_sm.tar.gz"
ensure_curl
echo "Downloading from $url"
curl -fsSLo act.tar.gz "$url"
tar -xzvf act.tar.gz act
rm act.tar.gz
mv act /usr/local/bin/act
