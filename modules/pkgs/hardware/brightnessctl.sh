#!/bin/bash

set -e

echo "Installing brightnessctl..."
echo ""

unmask_pkg "brightnessctl" "app-misc/brightnessctl" "~amd64"
echo ""

install_pkg "brightnessctl" "app-misc/brightnessctl"
echo ""
