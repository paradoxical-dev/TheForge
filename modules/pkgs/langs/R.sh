#!/bin/bash

set -e

echo "Installing R..."
echo ""

edit_use "R" "dev-lang/R" "cairo jpeg png"

install_pkg "R" "dev-lang/R"
echo ""
