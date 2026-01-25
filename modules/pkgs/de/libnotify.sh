#!/bin/bash

set -e

echo "Installing libnotify..."

install_pkg "libnotify" "x11-libs/libnotify"
echo ""
    
echo "Installing eselect notify-send..."
echo ""

install_pkg "eselect-notify-send" "app-eselect/eselect-notify-send"
echo ""
