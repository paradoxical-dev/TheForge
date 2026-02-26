#!/bin/bash

set -e

echo "Installing Hyprland..."
echo ""

edit_use "sonnet" "kde-frameworks/sonnet" "qml"
edit_use "xmlto" "app-text/xmlto" "text"

unmask_pkg "hyprwayland-scanner" "dev-util/hyprwayland-scanner" "~amd64"
echo ""

# TODO: hyprland package is being removed from main gentoo repo.
# We need to use the hyproverlay repo instead

# We unmask required packages from package.mask
echo "gui-wm/hyprland::hyproverlay" | sudo tee "/etc/portage/package.unmask/hyprland" > /dev/null
echo "dev-libs/hyprlang::hyproverlay" | sudo tee "/etc/portage/package.unmask/hyprlang" > /dev/null
echo "dev-libs/hyprgraphics::hyproverlay" | sudo tee "/etc/portage/package.unmask/hyprgraphics" > /dev/null
echo "gui-libs/aquamarine::hyproverlay" | sudo tee "/etc/portage/package.unmask/aquamarine" > /dev/null
echo "gui-libs/hyprutils::hyproverlay" | sudo tee "/etc/portage/package.unmask/hyprutils" > /dev/null
echo "dev-cpp/glaze::hyproverlay" | sudo tee "/etc/portage/package.unmask/glaze" > /dev/null

unmask_pkg "hyprlang" "dev-libs/hyprlang::hyproverlay" "~amd64"
echo ""
unmask_pkg "hyprgraphics" "dev-libs/hyprgraphics::hyproverlay" "~amd64"
echo ""
unmask_pkg "aquamarine" "gui-libs/aquamarine::hyproverlay" "~amd64"
echo ""
unmask_pkg "hyprutils" "gui-libs/hyprutils::hyproverlay" "~amd64"
echo ""
unmask_pkg "hyprwire" "gui-libs/hyprwire" "~amd64"
echo ""
unmask_pkg "hyprland-guiutils" "gui-libs/hyprland-guiutils" "~amd64"
echo ""
unmask_pkg "glaze" "dev-cpp/glaze::hyproverlay" "~amd64"
echo ""
unmask_pkg "hyprtoolkit" "gui-libs/hyprtoolkit" "~amd64"
echo ""

# unmask_pkg "hyprland" "gui-wm/hyprland" "~amd64"
# unmask_pkg "hyprland" "gui-wm/hyprland" "**"
# echo ""
# edit_use "hyprland" "gui-wm/hyprland" "qtutils"

install_pkg "hyprland" "gui-wm/hyprland::hyproverlay"
echo ""

# TODO: update hyprland config

# INFO: Commeneted out for rework with hyproverlay

# unmask_pkg "hyprutils" "gui-libs/hyprutils" "~amd64"
# echo ""
# install_pkg "hyprutils" "gui-libs/hyprutils"
# echo ""

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



# echo "Installing nelogind"
# echo ""

# install_pkg "elogind" "sys-auth/elogind"
# echo ""

# echo "Starting elogind service and adding to boot"
# echo ""

# sudo rc-update add elogind boot
# sudo rc-service elogind start



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

# sudo rc-update add display-manager default



echo -e "${green}Hyprland initialized successfully!${color_end}"
echo ""
