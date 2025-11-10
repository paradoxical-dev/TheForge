#!/bin/bash

set -e

echo "Installing nvm..."
echo ""

NVM_DIR="$HOME/.config/nvm"
INSTALL_URL="https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh"

if [[ ! -d "$NVM_DIR" ]]; then
    mkdir -p "$NVM_DIR"
fi

curl -o- "$INSTALL_URL" | PROFILE=/dev/null NVM_DIR="$NVM_DIR" bash
echo ""

echo "Installing latest node version..."
echo ""

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install node
echo ""
