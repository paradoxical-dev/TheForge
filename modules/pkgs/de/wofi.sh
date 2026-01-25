#!/bin/bash

set -e

echo "Installing wofi..."
echo ""

install_pkg "wofi" "gui-apps/wofi"
echo ""

echo "Copying config for wofi..."
echo ""

CONFIG_PATH="$HOME/.config/wofi"
DOTFILE_PATH="$PROFILE_DIR/configs/wofi"

backup_config "$CONFIG_PATH"

cp -r "$DOTFILE_PATH" "$CONFIG_PATH"

echo -e "${green}wofi config copied into $CONFIG_PATH"
echo ""
