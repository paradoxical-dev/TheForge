#!/bin/bash

set -e

echo "Installing COSMIC..."
echo ""

echo "Adding COSMIC overlay..."
echo ""
sudo eselect repository add cosmic-overlay git https://github.com/fsvm88/cosmic-overlay.git 
sudo emaint sync -r cosmic-overlay
echo ""

cat <<EOF | sudo tee "/etc/portage/package.accept_keywords/cosmic-de" > /dev/null
cosmic-base/* ~amd64
cosmic-de/* ~amd64
EOF

install_pkg "cosmic-meta" "cosmic-base/cosmic-meta"
echo ""
install_pkg "pop-theme-meta" "cosmic-base/pop-theme-meta"
echo ""
