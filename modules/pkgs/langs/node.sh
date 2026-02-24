#!/bin/bash

set -e

echo "Installing node..."
echo ""

sudo emerge --verbose --getbinpkg "net-libs/nodejs"
echo ""

# echo "Installing system node version..."
# echo ""

# NODE_VERSION=24.13.0
# ARCH=linux-x64
# NODE_DIR="/opt/nodejs"

# INSTALL_URL="https://nodejs.org/dist/v${NODE_VERSION}/node-${NODE_VERSION}-${ARCH}.tar.xz"

# sudo mkdir -p "$NODE_DIR"
# curl -fsSL "$INSTALL_URL" -o "/tmp/node-v${NODE_VERSION}-${ARCH}.tar.xz"

# echo "Unpacking node binary..."
# echo ""

# sudo tar -xJf "/tmp/node-v${NODE_VERSION}-${ARCH}.tar.xz" -C "$NODE_DIR"

# sudo ln -sfn "$NODE_DIR/node-v${NODE_VERSION}-${ARCH}" "$NODE_DIR/current"

# sudo ln -sfn "$NODE_DIR/current/bin/node" /usr/local/bin/node
# sudo ln -sfn "$NODE_DIR/current/bin/npm"  /usr/local/bin/npm
# sudo ln -sfn "$NODE_DIR/current/bin/npx"  /usr/local/bin/npx

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
