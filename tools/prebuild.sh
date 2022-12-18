#!/bin/bash -e
# This script is intended to be run before testing, packing and publishing. [1]
# It's responsible for ensuring that the bash_modules folder is copied into
# every single feature's src/* directory. These bash_modules are then sourced by
# the feature's install.sh script.
#
# 1. Glob the src/* directory.
# 2. Filter out any files.
# 3. Copy the bash_modules folder into each directory.
#
# Example:
#
#     # tree .
#     .
#     ├── bash_modules/
#     │   └── ensure_curl.sh
#     └── src/
#         └── act/
#             ├── install.sh
#             └── bash_modules/        <-- copied from bash_modules/
#                 └── ensure_curl.sh
#
#     # bash_modules/ensure_curl.sh
#     function ensure_curl() { ... }
#
#     # src/act/install.sh
#     source bash_modules/ensure_curl.sh
#
# Here we can see that the bash_modules folder is copied into the src/act/
# directory. This is done so that the install.sh script can source the
# bash_modules/ensure_curl.sh script. More details can be found on the wiki [2].
#
# [1]: https://github.com/devcontainers-contrib/features/tree/main/.github/workflows
# [2]: https://github.com/devcontainers-contrib/features/wiki/bash_modules


# 1. Glob the src/* directory.
for feature in src/*; do
  # 2. Filter out any files.
  if [[ -f "$feature" ]]; then
    continue
  fi

  # 3. Copy the bash_modules folder into each directory.
  cp -vr bash_modules "$feature/"
done
