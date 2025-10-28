#!/bin/bash

set -e

echo "Installing tealdeer..."
echo ""

unmask_pkg "tealdeer" "app-misc/tealdeer" "~amd64"
echo ""

install_pkg "tealdeer" "app-misc/tealdeer"
echo ""
