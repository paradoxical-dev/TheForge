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
    "cairo"
    "sound"
    "xft"
    "-gtk"
    "-motif"
    "games"
    "gsettings"
    "jpeg"
    "png"
    "svg"
    "gif"
    "webp"
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

echo ""

echo "Installing mdopen..."
echo ""

cargo install mdopen
echo ""

echo "Installing pandoc..."
echo ""

unmask_pkg "pandoc-bin" "app-text/pandoc-bin" "~amd64"
echo ""
unmask_pkg "pandoc-cli" "app-text/pandoc-cli" "~amd64"
echo ""

install_pkg "pandoc-bin" "app-text/pandoc-bin"
echo ""

echo "Installing poppler..."
echo ""

edit_use "poppler" "app-text/poppler" "boost cairo qt6 png"

install_pkg "poppler" "app-text/poppler"
echo ""

echo "Installing mu with emacs support..."
echo ""

edit_use "mu" "net-mail/mu" "emacs"

install_pkg "mu" "net-mail/mu"
echo ""

echo "Installing vips..."
echo ""

edit_use "vips" "media-libs/vips" "pdf svg webp"

install_pkg "vips" "media-libs/vips"
echo ""

echo "Installing graphviz..."
echo ""

edit_use "gd" "media-libs/gd" "fontconfig truetype"
edit_use "graphviz" "media-gfx/graphviz" "pdf svg qt6"

install_pkg "graphviz" "media-gfx/graphviz"
echo ""

echo "Installing aspell..."
echo ""

edit_use "aspell" "app-text/aspell" "L10N: en"

install_pkg "aspell" "app-text/aspell"
echo ""

echo "Installing leiningen..."
echo ""

install_pkg "leiningen" "dev-java/leiningen-bin"
echo ""

