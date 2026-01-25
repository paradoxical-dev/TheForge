#!/bin/bash

set -e

echo "Installing nix..."
echo ""

sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
echo ""

echo "Installing nixfmt..."
echo ""
