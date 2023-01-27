#!/bin/bash -e

if [[ -z $1 || -z $2 ]]; then
  echo "Usage: version.sh <id> <newversion>"
  echo "   or: version.sh <id> major|minor|patch"
  exit 1
fi

subject="src/$1/devcontainer-feature.json"
echo "Operating on $subject"

old_version="$(jq -r '.version' "$subject")"
echo "Old version: $old_version"

if [[ $2 == "major" ]]; then
  new_version="$(echo "$old_version" | awk -F. '{print ++$1 "." $2 "." $3}')"
elif [[ $2 == "minor" ]]; then
  new_version="$(echo "$old_version" | awk -F. '{print $1 "." ++$2 "." $3}')"
elif [[ $2 == "patch" ]]; then
  new_version="$(echo "$old_version" | awk -F. '{print $1 "." $2 "." ++$3}')"
else
  new_version="$2"
fi
echo "New version: $new_version"

jq ".version = \"$new_version\"" "$subject" | sponge "$subject"
echo "Updated $subject with new version"
