#!/bin/bash

set -e

echo "Installing nvm..."
echo ""

NVM_DIR="$HOME/.config/nvm"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | NVM_DIR="$NVM_DIR" bash
echo ""

echo "Installing latest node version..."
echo ""

nvm install node
echo ""
