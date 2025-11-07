#!/bin/bash

set -e

echo "Installing hyprsunset..."
echo ""

unmask_pkg "hyprsunset" "gui-apps/hyprsunset" "~amd64"
echo ""

install_pkg "hyprsunset" "gui-apps/hyprsunset"
echo ""
