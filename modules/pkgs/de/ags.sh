#!/bin/bash

set -e

echo "Installing AGS..."
echo ""

install_pkg "ninja" "dev-build/ninja"
echo ""

sudo emerge --verbose --getbinpkg "net-libs/nodejs"
echo ""

install_pkg "go" "dev-lang/go"
echo ""

install_pkg "gobject-introspection" "dev-libs/gobject-introspection"
echo ""

install_pkg "gtk" "gui-libs/gtk"
echo ""

install_pkg "gtk+" "x11-libs/gtk+"
echo ""

install_pkg "gtk-layer-shell" "gui-libs/gtk-layer-shell"
echo ""

install_pkg "gtk4-layer-shell" "gui-libs/gtk-layer-shell"
echo ""

edit_use "vala" "dev-lang/vala" "valadoc"
echo ""
install_pkg "vala" "dev-lang/vala"
echo ""

if [[ -d "$HOME/src/ags" ]]; then
    echo -e "${yellow}AGS already created. Skipping...${color_end}"
    echo ""
fi

mkdir -p "$HOME/src/ags"

git clone "https://github.com/aylur/ags.git" "$HOME/src/ags"
echo ""

cd "$HOME/src/ags"
npm install
meson setup build
sudo meson install -C build

echo -e "${green}AGS manually installed into $HOME/src/ags!${color_end}"
echo ""
