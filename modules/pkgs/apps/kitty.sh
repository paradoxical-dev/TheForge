#!/bin/bash

set -e

echo "Installing kitty..."
echo ""

install_pkg "kitty" "x11-terms/kitty"
echo ""

echo "Copying config for kitty..."
echo ""

CONFIG_PATH="$HOME/.config/kitty"
DOTFILE_PATH="$DEVICE_DIR/configs/kitty"

backup_config "$CONFIG_PATH"

cp -r "$DOTFILE_PATH" "$CONFIG_PATH"

echo -e "${green}kitty config copied into $CONFIG_PATH${color_end}"
echo ""
