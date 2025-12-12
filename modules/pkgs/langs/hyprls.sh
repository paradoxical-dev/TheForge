#!/bin/bash

set -e

echo "Updating go..."
echo ""
umask_pkg "go" "dev-lang/go" "~amd64"
echo ""
install_pkg "go" "dev-lang/go"
echo ""

echo "Installing hyprls..."
echo ""
go install github.com/hyprland-community/hyprls/cmd/hyprls@latest
echo ""

sudo cp $HOME/go/bin/hyprls /usr/local/bin/