#!/bin/bash

set -e

echo "Installing carapce..."
echo ""

unmask_pkg "carapace" "app-shells/carapace" "~amd64"
echo ""

install_pkg "carapace" "app-shells/carapace"
echo ""
