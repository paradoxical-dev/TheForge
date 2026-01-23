#!/bin/bash

set -e

echo "Installing emacs..."

edit_use "gcc" "sys-devel/gcc" "jit"
inform_msg "We'll need to rebuild gcc with the jit flag." "This may take a while..."
sleep 3
sudo emerge --verbose --changed-use "sys-devel/gcc"
echo ""

FLAGS=(
    "gui"
    "athena"
    "Xaw3d"
    "-gtk"
    "-motif"
    "games"
    "gsettings"
    "jpeg"
    "png"
    "svg"
    "mailutils"
    "sqlite"
    "tree-sitter"
    "jit"
    "dynamic-loading"
    "harfbuzz"
    "imagemagick"
    "gfile"
    "m17n-lib"
    "libxml2"
)
edit_use "emacs" "app-editors/emacs" "${FLAGS[@]}"
edit_use "emacs-common" "app-emacs/emacs-common" "gui games gsettings"

install_pkg "emacs" "app-editors/emacs"
echo ""

echo "Cloning Doom into ~/.config/emacs..."
echo ""

if ! -d "$HOME/.config"; then
    mkdir "$HOME/.config"
fi

git clone --depth 1 https://github.com/doomemacs/doomemacs "$HOME/.config/emacs"
echo ""

echo "Installing Doom emacs..."
echo ""

$HOME/.config/emacs/bin/doom install
echo ""

echo "Doom installed!"
echo ""

echo "Cloning Nexus config..."
echo ""

# TODO: make repo clone when remote
