#!/bin/bash

set -e

echo "Installing Hyprland..."
echo ""

install_pkg "Hyprland" "gui-wm/hyprland"
echo ""

echo "Copying config for hyprland..."
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

install_pkg "SDDM" "x11-misc/sddm"
echo ""

echo "Copying config for SDDM..."
echo ""



echo "Installing display-manager-init..."
echo ""

install_pkg "display-manager-init" "gui-libs/display-manager-init"
echo ""

echo "Copying config for display-manager..."
echo ""

echo "Adding display-manager service to default..."
echo ""

sudo rc-update add display-manager default
