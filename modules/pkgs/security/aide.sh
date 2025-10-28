#!/bin/bash

set -e

echo "Installing AIDE..."
echo ""

edit_use "aide" "app-forensics/aide" "curl mhash"

install_pkg "aide" "app-forensics/aide"
echo ""

echo "Copying config for AIDE..."
echo ""

CONFIG_PATH="/etc/aide/aide.conf"
DOTFILE_PATH="$DEVICE_DIR/configs/aide/aide.conf"

backup_config "$CONFIG_PATH" true

sudo mkdir -p $(dirname "$CONFIG_PATH")

sudo chown root:root "$CONFIG_PATH"
sudo chmod 600 "$CONFIG_PATH"

echo -e "${green}AIDE config copied into /etc/aide/aide.conf${color_end}"
echo ""

sudo mkdir -p /var/lib/aide
sudo chown root:root /var/lib/aide
sudo chmod 700 /var/lib/aide

sudo mkdir -p /var/log/aide
sudo chown root:root /var/log/aide
sudo chmod 700 /var/log/aide

inform_msg "Initializing AIDE database" "This may take a few minutes..."
sudo aide --init
sudo mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
echo ""

echo "Copying AIDE wrapper scripts..."
echo ""

SCRIPTS_DIR=$(dirname "$DOTFILE_PATH")

email=$(input "Email address (used to send findings)" "you@example.com")
sed -e "s/{{AIDE_EMAIL}}/$email/" "$SCRIPTS_DIR/aide-check.sh" \
    | sudo tee "/usr/local/bin/aide-check.sh" >/dev/null

sudo cp "$SCRIPTS_DIR/aide-update.sh" "/usr/local/bin/aide-update.sh"

sudo chmod +x /usr/local/bin/aide-*.sh

echo "Adding CRON jobs..."
echo ""

sudo tee /etc/cron.daily/aide-check >/dev/null <<'EOF'
#!/bin/bash
# Daily AIDE check job
/usr/local/bin/aide-check.sh
EOF

sudo tee /etc/cron.weekly/aide-update >/dev/null <<'EOF'
#!/bin/bash
# Weekly AIDE database update
/usr/local/bin/aide-update.sh
EOF

sudo chmod +x /etc/cron.daily/aide-check
sudo chmod +x /etc/cron.weekly/aide-update
sudo chown root:root /etc/cron.daily/aide-check /etc/cron.weekly/aide-update

echo -e "${green}AIDE initialized successfully!${color_end}"
