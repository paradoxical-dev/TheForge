#!/bin/bash

set -e

echo "Installing libnotify..."

if [[ ! "$PROFILE" = "kde" ]]; then
    edit_use "notification-daemon" "virtual/notification-daemon" "-kde -gnome"
fi

install_pkg "libnotify" "x11-libs/libnotify"
echo ""
    
echo "Installing eselect notify-send..."
echo ""

install_pkg "eselect-notify-send" "app-eselect/eselect-notify-send"
echo ""
