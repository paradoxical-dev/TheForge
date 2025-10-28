#!/bin/bash

set -e

echo "Installing fastfetch..."
echo ""

install_pkg "fastfetch" "app-misc/fastfetch"
echo ""

echo "Copying config for fastfetch..."
echo ""

CONFIG_PATH="$HOME/.config/fastfetch/config.jsonc"
DOTFILE_PATH="$DEVICE_DIR/configs/fastfetch/main.jsonc"

backup_config "$CONFIG_PATH"

mkdir -p $(dirname "$CONFIG_PATH")

cp $DOTFILE_PATH $CONFIG_PATH

echo -e "${green}fastfetch config copied into ~/.config/fastfetch/config.jsonc${color_end}"
echo ""
