#!/bin/bash

set -e

echo "Installing isync..."
echo ""

install_pkg "isync" "net-mail/isync"
echo ""

echo "Copying config for isync..."
echo ""

if [[ ! -d "$HOME/.config" ]]; then
    mkdir -p "$HOME/.config"
fi

TEMPLATE_PATH="$HOME/.config/isyncrc"
DOTFILE_PATH="$DEVICE_DIR/configs/isync/isyncrc"

backup_config "$TEMPLATE_PATH" true

inform_msg "Currently only gmail is supported for automated setup." \
    "If you use a different email provider, you'll need to manually edit the config file in $HOME/.config/isync/mbsyncrc'"
sleep 3

email=$(input "Your email address" "you@provider.com")

sed -e "s/{{EMAIL_ADDRESS}}/$email/" \
    "$TEMPLATE_PATH" | tee "$DOTFILE_PATH" >/dev/null

echo "${green}isync config copied into $DOTFILE_PATH ${color_end}"

echo "Creating mail directory in $HOME/Mail..."
echo ""

if [[ ! -d "$HOME/Mail" ]]; then
    mkdir -p "$HOME/Mail/gmail/Inbox"
    mkdir -p "$HOME/Mail/gmail/Sent"
    mkdir -p "$HOME/Mail/gmail/Trash"
else
    echo "${yellow}Mail directory already exists. Skipping...${color_end}"
    echo ""
fi
