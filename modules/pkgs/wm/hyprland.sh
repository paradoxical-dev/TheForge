#!/bin/bash

set -e

echo "Installing Hyprland..."
echo ""

edit_use "sonnet" "kde-frameworks/sonnet" "qml"
edit_use "xmlto" "app-text/xmlto" "text"

install_pkg "hyprland" "gui-wm/hyprland"
echo ""

# TODO: update hyprland config
unmask_pkg "hyprutils" "gui-libs/hyprutils" "~amd64"
echo ""
install_pkg "hyprutils" "gui-libs/hyprutils"
echo ""

install_pkg "xdg-desktop-portal" "sys-apps/xdg-desktop-portal"
echo ""

unmask_pkg "xdg-desktop-portal-hyprland" "gui-libs/xdg-desktop-portal-hyprland" "~amd64"
echo ""
unmask_pkg "sdbus-c++" "dev-cpp/sdbus-c++" "~amd64"
echo ""
install_pkg "xdg-desktop-portal-hyprland" "gui-libs/xdg-desktop-portal-hyprland"
echo ""

install_pkg "xdg-desktop-portal-gtk" "sys-apps/xdg-desktop-portal-gtk"
echo ""

echo "Copying config for hyprland..."
echo ""

CONFIG_PATH="$HOME/.config"
DOTFILE_PATH="$PROFILE_DIR/configs/hypr"

backup_config "$CONFIG_PATH/hypr"

cp -r "$DOTFILE_PATH" "$CONFIG_PATH"

THEME_FILE="$DOTFILE_PATH/conf/themes/main.conf"

cp "$THEME_FILE" "$CONFIG_PATH/hypr/conf/themes/current.conf"

echo -e "${green}Hyprland config copied into $CONFIG_PATH${color_end}"
echo ""



echo "Installing elogind"
echo ""

install_pkg "elogind" "sys-auth/elogind"
echo ""

echo "Starting elogind service and adding to boot"
echo ""

sudo rc-update add elogind boot
sudo rc-service elogind start



echo "Installing SDDM..."
echo ""

install_pkg "sddm" "x11-misc/sddm"
echo ""

echo "Copying config for SDDM..."
echo ""

# TODO: add sddm config

CONFIG_PATH="/etc/sddm.conf.d/override.conf"
DOTFILE_PATH="$PROFILE_DIR/configs/sddm/override.conf"

backup_config "$CONFIG_PATH" true

sudo cp "$DOTFILE_PATH" "$CONFIG_PATH"

echo -e "${green}SDDM override.conf copied into $CONFIG_PATH${color_end}"
echo ""

echo "Adding sddm user to video group..."
echo ""

sudo usermod -a -G video sddm
echo ""



echo "Installing display-manager-init..."
echo ""

install_pkg "display-manager-init" "gui-libs/display-manager-init"
echo ""

echo "Copying config for display-manager-init..."
echo ""

CONFIG_PATH="/etc/conf.d/display-manager"
DOTFILE_PATH="$PROFILE_DIR/configs/sddm/display-manager"

backup_config "$CONFIG_PATH" true

sudo cp "$DOTFILE_PATH" "$CONFIG_PATH"

echo "Adding display-manager service to default..."
echo ""

sudo rc-update add display-manager default



echo -e "${green}Hyprland initialized successfully!${color_end}"
echo ""
