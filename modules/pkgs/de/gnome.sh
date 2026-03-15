#!/bin/bash

set -e

echo "Installing GNOME..."
echo ""

echo "Creating new profile repository..."
echo ""

echo "Installing eselect-repository"
echo ""

install_pkg "eselect-repository" "app-eselect/eselect-repository"
echo ""

LOCAL_PROFILE_DIR="/var/db/repos/local"

if ! eselect repository list | grep "local"; then
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
echo "amd64 hardened-gnome-selinux-systemd stable" | sudo tee "$LOCAL_PROFILE_DIR/profiles/profiles.desc" > /dev/null

LOCAL_PROFILE_DIR="/var/db/repos/local/profiles/hardened-gnome-selinux-systemd"
sudo mkdir -p "$LOCAL_PROFILE_DIR"

sudo touch "$LOCAL_PROFILE_DIR/eapi"
echo "8" | sudo tee "$LOCAL_PROFILE_DIR/eapi"

sudo touch "$LOCAL_PROFILE_DIR/parent"
cat <<EOF | sudo tee "$LOCAL_PROFILE_DIR/parent" > /dev/null
gentoo:default/linux/amd64/23.0/hardened/systemd
gentoo:targets/desktop/gnome
gentoo:features/selinux
EOF

echo -e "${green}Local repo created!${color_end}"
echo ""

inform_msg "The following output is from the profile list, filtering out only those from the new local repository" "Input the corresponding number for the 'hardened-plasma-selinux (stable)' profile"
sleep 3
eselect profile list | grep "local"
profile_number=$(input "Profile number: " "")
sudo eselect profile set "$profile_number"

echo -e "${green}gnome-hardened-selinux-systemd profile set!${color_end}"
echo ""

inform_msg "A world rebuild in required with the new profile." "This may take a while..."
sleep 3

sudo emerge -vuDN @world
echo ""
sudo emerge @preserved-rebuild
echo ""

unmask_pkg "libadwaita" "gui-libs/libadwaita" "~amd64"
echo ""
unmask_pkg "gtk" "gui-libs/gtk" "~amd64"
echo ""
unmask_pkg "gtkmm" "dev-cpp/gtkmm" "~amd64"
echo ""

install_pkg "gnome" "gnome-base/gnome"
echo ""

unmask_pkg "extension-manager" "gnome-extra/extension-manager" "~amd64"
echo ""

install_pkg "extension-manager" "gnome-extra/extension-manager"
echo ""
