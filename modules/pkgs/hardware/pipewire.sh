#!/bin/bash

set -e

echo "Installing pipewire..."
echo ""

flags="man sound-server v4l modemmanager"
edit_use "pipewire" "media-video/pipewire" ""

install_pkg "pipewire" "media-video/pipewire"
echo ""

echo "Adding current user to pipewire group..."
echo ""

user=$(whoami)
sudo usermod -aG pipewire "$user"

echo "Installing wireplumber..."
echo ""

install_pkg "wireplumber" "media-video/wireplumber"
echo ""
