#!/bin/bash
set -e

ghc --version | grep "9\.4\.0"
cabal --version | grep "3\.7\.0\.0"
stack --version | grep "2\.8\.0"
