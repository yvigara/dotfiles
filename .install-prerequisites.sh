#!/bin/bash
set -ex

if type bw >/dev/null 2>&1; then
  echo "Bitwarden cli is already installed"
else
  brew install bitwarden-cli
fi
