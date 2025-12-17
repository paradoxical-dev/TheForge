#!/bin/bash

set -e

echo "Installing end-4 dots..."
echo ""

inform_msg "The following command will list the gcc versions." "end-4 requires gcc version >= 15. Please input the number which satisifes this."
gcc-config -l
sleep 1

correct_version=$()
sudo gcc-config $correct_version
echo ""

inform_msg "We will now need to rebuild the entire system from an empty tree." "This could take a while..."
sleep 2
sudo emerge -e @world
echo ""

echo "System rebuilt against newer gcc version"
echo ""
echo "Cloning end-4 repo..."
echo ""

if [[ ! -d "$HOME/src" ]]; then
    mkdir -p "$HOME/src"
fi
git clone "https://github.com/end-4/dots-hyprland.git" "$HOME/src/end-4"
# cd "$HOME/src/end-4"
echo ""

inform_msg "This will now run an interative script which could take a while..." "It may run into errors. In any case open a new tty to make the fix"
sleep 2

$HOME/src/end-4/setup install
echo ""