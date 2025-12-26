#!/bin/bash

set -e

echo "Installing VSCodium..."
echo ""

unmask_pkg "vscodium" "app-editors/vscodium"
echo ""
install_pkg "vscodium" "app-editors/vscodium"
echo ""

echo "Copying config for VSCodium..."
echo ""

DOTFILE_DIR="$DEVICE_DIR/configs/VSCodium"
CONFIG_PATH="$HOME/.config/VSCodium/User"

backup_config "$CONFIG_PATH/settings.json"
backup_config "$CONFIG_PATH/keybindings.json"
backup_config "$CONFIG_PATH/nvim"
backup_config "$CONFIG_PATH/custom-css"

# cp -r "$DEVICE_DIR/configs/VSCodium/"* "$HOME/.config/VSCodium/User/"
rm -rf \
  "$CONFIG_DIR/settings.json" \
  "$CONFIG_DIR/keybindings.json" \
  "$CONFIG_DIR/nvim" \
  "$CONFIG_DIR/custom-css"

ln -s "$DOTFILE_DIR/settings.json" "$CONFIG_PATH/settings.json"
ln -s "$DOTFILE_DIR/keybindings.json" "$CONFIG_PATH/keybindings.json"
ln -s "$DOTFILE_DIR/nvim" "$CONFIG_PATH/nvim"
ln -s "$DOTFILE_DIR/custom-css" "$CONFIG_PATH/custom-css"