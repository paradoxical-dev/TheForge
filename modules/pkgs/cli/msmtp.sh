#!/bin/bash

set -e

echo "Installing msmtp..."
echo ""

install_pkg "msmtp" "mail-mta/msmtp"
echo ""

inform_msg "Starting email configuration for msmtp"

TEMPLATE="$DEVICE_DIR/configs/msmtp/msmtp.conf"
CONFIG_PATH="/etc/msmtprc"

default_providers=("Gmail" "Proton" "Custom")
provider=$(choose_one "Email provider" "${default_providers[@]}")
email=$(input "Your email address" "you@provider.com")
pass=$(input "App password (from provider)" "")

case "$provider" in
    "Gmail")
        host="smtp.gmail.com"
        port="587"
    ;;
    "Proton")
        host="smtp.protonmail.ch"
        port="587"
    ;;
    "Custom")
        host=$(input "SMTP host" "smtp.provider.com")
        port=$(input "SMTP port" "587")
    ;;
esac

sed \
    -e "s/{{SMTP_HOST}}/$host/" \
    -e "s/{{SMTP_PORT}}/$port/" \
    -e "s/{{EMAIL_ADDRESS}}/$email/" \
    -e "s/{{SMTP_PASS}}/$pass/" \
    "$TEMPLATE" | sudo tee "$CONFIG_PATH" >/dev/null

sudo chown root:root "$CONFIG_PATH"
sudo chmod 600 "$CONFIG_PATH"

echo -e "${green}Email configured for msmtp!${color_end}"
echo ""

echo "Linking msmtp to /usr/sbin/sendmail"
echo ""

sudo ln -sf /usr/bin/msmtp /usr/bin/sendmail
