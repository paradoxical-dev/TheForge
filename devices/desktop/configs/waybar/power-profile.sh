#!/usr/bin/env sh

current_prof=$(powerprofilesctl list | grep "\*" | awk '{print $2}' | cut -d ":" -f1)

case "$current_prof" in
    "performance")
        new_prof="balanced"
        ;;
    "balanced")
        new_prof="power-saver"
        ;;
    "power-saver")
        new_prof="performance"
        ;;
esac

powerprofilesctl set "$new_prof"

notify-send "Power Profile" "Power profile set to $new_prof"
