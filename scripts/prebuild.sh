#!/bin/bash -eu
# Prebuild script
# ===============
#
# 1. Generates all the src/*/*.sh files that each feature imports with source.
#
# 📚 Further reading: 

# The glob expands to ONLY DIRECTORIES since it has a trailing slash. It also
# adds this trailing slash to every one of its items.
#
# Examples of $SRCDIR:
#
#   src/jest/
#   src/haskell/
#   src/pulumi/
#
# Since the cp command dest param has a trailing slash, it will copy anything
# to the INSIDE OF the folder, instead of copying it TO THE FOLDER NAME.
# That means it generates src/jest/bash_modules/*.sh instead of src/jest/*.sh
for SRCDIR in src/*/; do
  cp -vr bash_modules "$SRCDIR"
done
