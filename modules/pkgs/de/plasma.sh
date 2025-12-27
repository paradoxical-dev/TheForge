#!/bin/bash

set -e

echo "Installing KDE Plasma..."
echo ""

echo "Creating new profile repository..."
echo ""

echo "Installing eselect-repository"
echo ""

install_pkg "eselect-repository" "app-eselect/eselect-repository"
echo ""

LOCAL_PROFILE_DIR="/var/db/repos/local"

if ! eselect repository list | grep -q "^local"; then
    eselect repository create local
fi
cat <<EOF | sudo tee "$LOCAL_PROFILE_DIR/metadata/layout.conf" > /dev/null
masters = gentoo
thin-manifests = true
sign-manifests = false
profile-formats = portage-2
EOF

# sudo mkdir -p "$LOCAL_PROFILE_DIR/profiles"
sudo touch "$LOCAL_PROFILE_DIR/profiles/profiles.desc"
echo "amd64 hardened-plasma-selinux stable" | sudo tee "$LOCAL_PROFILE_DIR/profiles/profiles.desc" > /dev/null

LOCAL_PROFILE_DIR="/var/db/repos/local/profiles/hardened-plasma-selinux"
sudo mkdir -p "$LOCAL_PROFILE_DIR"

sudo touch "$LOCAL_PROFILE_DIR/eapi"
echo "8" | sudo tee "$LOCAL_PROFILE_DIR/eapi"

sudo touch "$LOCAL_PROFILE_DIR/parent"
cat <<EOF | sudo tee "$LOCAL_PROFILE_DIR/parent" > /dev/null
gentoo:default/linux/amd64/23.0/hardened
gentoo:targets/desktop/plasma
gentoo:features/selinux
EOF

echo -e "${green}Local repo created!${color_end}"
echo ""

inform_msg "The following output is from the profile list, filtering out only those from the new local repository" "Input the corresponding number for the 'hardened-plasma-selinux (stable)' profile"
sleep 3
eselect profile list | grep "local"
profile_number=$(input "Profile number: " "")
sudo eselect profile set "$profile_number"

echo -e "${green}plasma-hardened-selinux profile set!${color_end}"
echo ""

inform_msg "A world rebuild in required with the new profile." "This may take a while..."
sleep 3

sudo emerge -vuDN @world
echo ""
sudo emerge @preserved-rebuild
echo ""