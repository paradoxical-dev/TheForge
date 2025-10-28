#!/bin/bash

set -e

echo "Installing neovim..."
echo ""

install_pkg "neovim" "app-editors/neovim"
echo ""

echo "Pulling config for neovim..."
echo ""

CONFIG_PATH="$HOME/.config/nvim"

backup_config "$CONFIG_PATH"

mkdir -p "$CONFIG_PATH"

git clone https://github.com/paradoxical-dev/neovim.git "$CONFIG_PATH"

echo ""
echo -e "${green}Neovim config pulled into ~/.config/nvim${color_end}"
echo ""
