#!/bin/bash

set -e

echo "Installing tmux..."
echo ""

install_pkg "tmux" "app-misc/tmux"
echo ""

echo "Copying config for tmux..."
echo ""

CONFIG_PATH="$HOME/.config/tmux/tmux.conf"
DOTFILE_PATH="$DEVICE_DIR/configs/tmux/main.conf"

backup_config "$CONFIG_PATH"

mkdir -p $(dirname "$CONFIG_PATH")

cp "$DOTFILE_PATH" "$CONFIG_PATH"

echo -e "${green}tmux config copied into ~/.config/tmux/tmux.conf${color_end}"
echo ""
