#!/bin/bash

set -e

echo "Installing wayland..."
echo ""

install_pkg "wayland" "dev-libs/wayland"
echo ""

echo "Installing wayland-utils..."
echo ""

install_pkg "wayland-utils" "app-misc/wayland-utils"
echo ""

echo "Installing wlroots..."
echo ""

install_pkg "wlroots" "gui-libs/wlroots"
echo ""

echo "Installing Xwayland..."
echo ""

install_pkg "xwayland" "x11-base/xwayland"
echo ""

echo "Installing qtwayland..."
echo ""

install_pkg "qtwayland" "dev-qt/qtwayland"
echo ""
