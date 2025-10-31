#!/bin/bash

set -e

echo "Installing mesa..."
echo ""

edit_use "mesa" "media-libs/mesa" "lm-sensors"

install_pkg "mesa" "media-libs/mesa"
echo ""

echo "Installing vulkan-loader..."
echo ""

edit_use "vulkan-loader" "media-libs/vulkan-loader" "layers"

install_pkg "vulkan-loader" "media-libs/vulkan-loader"
echo ""

echo "Installing vulkan-tools..."
echo ""

install_pkg "vulkan-tools" "dev-util/vulkan-tools"
echo ""

echo "Installing libdrm..."
echo ""

install_pkg "libdrm" "x11-libs/libdrm"
echo ""

echo "Installing libva-intel-media-driver..."
echo ""

install_pkg "libva-intel-media-driver" "media-libs/libva-intel-media-driver"
echo ""
