#!/bin/bash

set -e

echo "Installing carapce..."
echo ""

unmask_pkg "carapace" "app-shells/carapace" "~amd64"
echo ""

if [[ ! -d "$HOME/.cache/nushell" ]]; then
    mkdir "$HOME/.cache/nushell"
fi

install_pkg "carapace" "app-shells/carapace"
echo ""
