#!/bin/bash

set -e

echo "Installing hypridle..."
echo ""

unmask_pkg "hypridle" "gui-apps/hypridle" "~amd64"
echo ""

install_pkg "hypridle" "gui-apps/hypridle"
echo ""

echo "Enabling hypridle service for user $USER"
echo ""

systemctl --user enable hypridle
echo ""
