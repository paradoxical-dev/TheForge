#!/usr/bin/env sh

battery_perc=$(acpi -b | awk -F ', ' {print $2})

echo "$battery_perc"
exit 0
