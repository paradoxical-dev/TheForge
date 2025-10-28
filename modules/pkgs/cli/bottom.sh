#!/bin/bash

set -e

echo "Installing bottom..."
echo ""

edit_use "bottom" "sys-process/bottom" "-zfs"
echo ""

install_pkg "bottom" "sys-process/bottom"
echo ""
