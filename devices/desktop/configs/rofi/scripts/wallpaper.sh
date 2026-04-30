#!/usr/bin/env bash

DIR="$HOME/test_scripts/wallpapers"

if [[ ! -d "$DIR" ]]; then
    echo "Directory $DIR does not exist."
    exit 1
fi

selected=$(find "$DIR" -maxdepth 1 -type f -print0 |
    while IFS= read -r -d '' file; do
        printf '%s\0icon\x1f%s\n' "$file" "$file"
    done |
    rofi -dmenu -theme ~/.config/rofi/launchers/wallpapers.rasi)

[[ -z "$selected" ]] && exit 0

awww img "$selected" --transition-type center

wall_name=$(basename "$selected")
notify-send "System" "Changed current wallpaper to $wall_name"
