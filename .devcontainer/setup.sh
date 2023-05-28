#!/usr/bin/env bash

npm install -g @devcontainers/cli

pipx install shfmt-py

# this will add hover annotations in shell script files, assuming mads-hartmann.bash-ide-vscod is installed
docker container run --name explainshell --restart always -p 5000:5000 -d spaceinvaderone/explainshell
