#!/bin/bash

set -e

echo "Installing yazi..."
echo ""

unmask_pkg "yazi" "app-misc/yazi" "~amd64"
echo ""

install_pkg "yazi" "app-misc/yazi"
echo ""

