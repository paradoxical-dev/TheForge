#!/bin/bash

set -e

echo "Installing zsh..."
echo ""

install_pkg "zsh" "app-shells/zsh"
echo ""

echo "Installing gentoo-zsh-completions..."
echo ""

install_pkg "gentoo-zsh-completions" "app-shells/gentoo-zsh-completions"
echo ""

echo "Copying config for zsh..."
echo ""

CONFIG_PATH="$HOME/.zshrc"
DOTFILE_PATH="$DEVICE_DIR/configs/shells/zsh/base.zsh"

backup_config "$CONFIG_PATH"

cp $DOTFILE_PATH $CONFIG_PATH

echo -e "${green}zsh config copied into ~/.zshrc${color_end}"
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
