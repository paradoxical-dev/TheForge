#!/bin/bash

set -e

echo "Installing firefox..."
echo ""

edit_use "alsa-plugins" "media-plugins/alsa-plugins" "pulseaudio"

install_pkg "firefox" "www-client/firefox-bin"
echo ""
