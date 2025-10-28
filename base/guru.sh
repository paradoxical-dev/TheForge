#!/bin/bash

# INFO: Adds guru repo to portage and conditionally syncs the database

if [[ -e "/var/db/repos/guru/" ]]; then
    echo -e "${green}GURU repository alredy exists${color_end}"
else
    if ! pkg_exists "eselect-repository"; then
        echo "eselect-repository not installed..."
        sudo emerge --verbose --noreplace "app-eselect/eselect-repository"
    fi
    sudo eselect repository enable guru
fi

gum_confirm "Would you like to sync the database? [recommended]"
sync_db=$?

if [ $sync_db -eq 0 ]; then
    sudo emerge --sync
fi

