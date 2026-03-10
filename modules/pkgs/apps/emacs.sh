#!/bin/bash

set -e

echo "Installing emacs..."

edit_use "gcc" "sys-devel/gcc" "jit"
inform_msg "We'll need to rebuild gcc with the jit flag." "This may take a while..."
sleep 3
sudo emerge --verbose --changed-use "sys-devel/gcc"
echo ""

FLAGS=(
    "-Xaw3d"
    "-athena"
    "-motif"
    "cairo"
    "dbus"
    "dynamic-loading"
    "games"
    "gfile"
    "gif"
    "gsettings"
    "gtk"
    "gui"
    "harfbuzz"
    "imagemagick"
    "jit"
    "jpeg"
    "libxml2"
    "m17n-lib"
    "mailutils"
    "png"
    "sound"
    "sqlite"
    "svg"
    "tree-sitter"
    "webp"
    "xft"
)
edit_use "emacs" "app-editors/emacs" "${FLAGS[@]}"
edit_use "emacs-common" "app-emacs/emacs-common" "gui games gsettings"
unmask_pkg "emacs" "app-editors/emacs" "**" # v31

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

#---------------dependencies

#----------for md parsing
echo "Installing mdopen..."
echo ""

cargo install mdopen
echo ""

#----------for document conversion
echo "Installing pandoc..."
echo ""

unmask_pkg "pandoc-bin" "app-text/pandoc-bin" "~amd64"
echo ""
unmask_pkg "pandoc-cli" "app-text/pandoc-cli" "~amd64"
echo ""

install_pkg "pandoc-bin" "app-text/pandoc-bin"
echo ""

#----------for pdf-tools
echo "Installing poppler..."
echo ""

edit_use "poppler" "app-text/poppler" "boost cairo qt6 png"

install_pkg "poppler" "app-text/poppler"
echo ""

#----------for mu4e
echo "Installing mu with emacs support..."
echo ""

edit_use "mu" "net-mail/mu" "emacs"

install_pkg "mu" "net-mail/mu"
echo ""

#----------for image thumbnails
echo "Installing vips..."
echo ""

edit_use "vips" "media-libs/vips" "pdf svg webp"

install_pkg "vips" "media-libs/vips"
echo ""

#----------for roam graph
echo "Installing graphviz..."
echo ""

edit_use "gd" "media-libs/gd" "fontconfig truetype"
edit_use "graphviz" "media-gfx/graphviz" "pdf svg qt6"

install_pkg "graphviz" "media-gfx/graphviz"
echo ""

#----------for flyspell/aspell
echo "Installing aspell..."
echo ""

edit_use "aspell" "app-text/aspell" "L10N: en"

install_pkg "aspell" "app-text/aspell"
echo ""

#----------for dict lookup
echo "Installing wordnet..."
echo ""

install_pkg "wordnet" "app-dict/wordnet"
echo ""

#----------for ejc-sql
echo "Installing leiningen..."
echo ""

install_pkg "leiningen" "dev-java/leiningen-bin"
echo ""

#----------for EAF
echo "Installing pyqt5..."
echo ""

edit_use "pyqt5" "dev-python/pyqt5" "gui network dbus multimedia opengl svg widgets"

install_pkg "pyqt5" "dev-python/pyqt5"
echo ""

echo "Installing qtwebengine..."
echo ""

# NOTE: The '--binpkg-respect-use=n' option is for compatibility with all profiles
# It should work fine if using just for EAF however, for other needs it may need
# to be rebuilt from source (not binary)
sudo emerge --verbose --getbinpkg --binpkg-respect-use=n "dev-qt/qtwebengine"
echo ""

echo "Installing nodejs..."
echo ""

sudo emerge --verbose --getbinpkg --noreplace "net-libs/nodejs"
echo ""

echo "Installing python-epc..."
echo ""

unmask_pkg "epc" "app-emacs/epc" "~amd64"
echo ""
unmask_pkg "ctable" "app-emacs/ctable" "~amd64"
echo ""

install_pkg "epc" "app-emacs/epc"
echo ""

echo "Cloning EAF repo..."
echo ""

if [[ ! -d "$HOME/src/emacs-eaf" ]]; then
    mkdir -p "$HOME/src/emacs-eaf"
    git clone --depth=1 -b master "https://github.com/emacs-eaf/emacs-application-framework.git" "$HOME/src/emacs-eaf"
    echo ""
    chmod +x "$HOME/src/emacs-eaf/install-eaf.py"
    "$HOME/src/emacs-eaf/install-eaf.py"
    echo ""
    echo -e "${green}EAF installed successfully!${color_end}"
else
    echo -e "${green}EAF already installed!${color_end}"
    echo ""
fi
