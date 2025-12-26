#!/bin/bash

set -e

echo "Installing matugen..."
echo ""

unmask_pkg "matugen" "x11-misc/matugen" "~amd64"
echo ""
install_pkg "matugen" "x11-misc/matugen"
echo ""