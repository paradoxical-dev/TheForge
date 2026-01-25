#!/bin/bash

set -e

echo "Installing wlogout..."
echo ""

unmask_pkg "wlogout" "gui-apps/wlogout" "~amd64"
echo ""

install_pkg "wlogout" "gui-apps/wlogout"
echo ""
