#!/bin/bash

set -e

echo "Installing AGS..."
echo ""

install_pkg "meson" "dev-build/meson"
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

unmask_pkg "eselect-vala" "app-eselect/eselect-vala" "~amd64"
echo ""
install_pkg "eselect-vala" "app-eselect/eselect-vala"
echo ""

#----------vala needs special package and linking to avoid build errors

echo "Please choose the version of vala to use."
echo "If unsure, select the number of the latest version..."
echo ""

selected_vala=$(input "Select vala version..." "1")
if [[ -z "$selected_vala" ]]; then
    selected_vala="1"
fi

sudo eselect vala set "$selected_vala"

# HACK: This may need to be changed somehow. We'll hardcode it for now
sudo ln -s "/usr/bin/valadoc-0.56" "/usr/bin/valadoc"

if [[ -d "$HOME/src/astal" ]]; then
    echo -e "${yellow}Astal already pulled into $HOME/src/astal. Skipping repo clone...${color_end}"
    echo ""
else
    mkdir -p "$HOME/src/astal"
fi

git clone "https://github.com/aylur/astal.git" "$HOME/src/astal"
echo ""

cd "$HOME/src/astal/lib/astal/io"
meson setup build --prefix=/usr
meson install -C build

cd "$HOME/src/astal/lib/astal/gtk3"
meson setup build --prefix=/usr
meson install -C build

cd "$HOME/src/astal/lib/astal/gtk4"
meson setup build --prefix=/usr
meson install -C build

cd "$HOME/src/astal/lib/hyprland"
meson setup build --prefix=/usr
meson install -C build

if [[ -d "$HOME/src/ags" ]]; then
    echo -e "${yellow}AGS already pulled into $HOME/src/ags. Skipping repo clone...${color_end}"
    echo ""
else
    mkdir -p "$HOME/src/ags"
fi


git clone "https://github.com/aylur/ags.git" "$HOME/src/ags"
echo ""

cd "$HOME/src/ags"
npm install
meson setup build
sudo meson install -C build

echo -e "${green}AGS manually installed into $HOME/src/ags!${color_end}"
echo ""

echo "Installing sass..."
echo ""

install_pkg "dev-ruby/sass"
echo ""
