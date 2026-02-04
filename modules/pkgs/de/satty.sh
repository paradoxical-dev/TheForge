#!/bin/bash

set -e

echo "Installing satty..."
echo ""

unmask_pkg "satty" "gui-apps/satty" "~amd64"
echo ""

install_pkg "satty" "gui-apps/satty"
echo ""
