#!/bin/bash

set -e

echo "Installing pipewire..."
echo ""

flags="man sound-server v4l modemmanager"
edit_use "pipewire" "media-video/pipewire" "$flags"

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

echo "Enabling pipewire service..."
echo ""

systemctl --user disable --now pulseaudio.socket pulseaudio.service
systemctl --user enable --now pipewire-pulse.socket
systemctl --user enable --now pipewire.service
systemctl --user enable --now wireplumber.service
echo ""
