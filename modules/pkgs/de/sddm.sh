#!/bin/bash

set -e

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

echo "Installing sugar-candy theme..."
echo ""

install_pkg "unzip" "app-arch/unzip"

sudo wget -P /tmp \
    https://gitlab.com/api/v4/projects/37107648/packages/generic/sddm-eucalyptus-drop/2.0.0/sddm-eucalyptus-drop-v2.0.0.zip

sudo unzip /tmp/sddm-eucalyptus-drop-v2.0.0.zip -d /usr/share/sddm/themes/

if [[ ! -d "/etc/sddm.conf.d" ]]; then
    sudo mkdir "/etc/sddm.conf.d"
fi

CONFIG_PATH="/etc/sddm.conf.d/theme.conf"
DOTFILE_PATH="$PROFILE_DIR/configs/sddm/theme.conf"

backup_config "$CONFIG_PATH" true

sudo cp "$DOTFILE_PATH" "CONFIG_PATH"

echo -e "${green}SDDM theme.conf copied into $CONFIG_PATH${color_end}"
echo ""

echo "Adding sddm user to video group..."
echo ""

sudo usermod -a -G video sddm
echo ""
