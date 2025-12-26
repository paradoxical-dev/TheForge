#!/bin/bash

set -e

echo "Installing nushell..."
echo ""

install_pkg "nushell" "app-shells/nushell"
echo ""

echo "Installing starship..."
echo ""

install_pkg "starship" "app-shells/starship"
echo ""

echo "Copying config for starship..."
echo ""

CONFIG_PATH="$HOME/.config/starship.toml"
DOTFILE_PATH="$DEVICE_DIR/configs/starship/inline.toml"

backup_config "$CONFIG_PATH"

cp $DOTFILE_PATH $CONFIG_PATH

echo -e "${green}starship config copied into ~/.config/starship.toml${color_end}"
echo ""