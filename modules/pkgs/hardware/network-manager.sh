#!/bin/bash

set -e

echo "Installing networkmanager..."
echo ""

flags="-ppp -wext iptables nftables"
edit_use "networkmanager" "net-misc/networkmanager" "$flags"

install_pkg "networkmanager" "net-misc/networkmanager"
echo ""

echo "Removing other network management services..."
echo ""

for x in /etc/runlevels/default/net.* ; do 
    sudo rc-update del $(basename $x) default || true
    sudo rc-service --ifstarted $(basename $x) stop || true
    echo ""
done

if rc-update show default | grep -q '^ *dhcpcd'; then
    echo -e "${yellow}dhcpcd found in default runlevel. Removing...${color_end}"
    echo ""

    sudo rc-update del dhcpcd default
    echo ""
fi

echo "Starting NetworkManager service and adding to default..."
echo ""

sudo rc-service NetworkManager start
sudo rc-update add NetworkManager default
echo ""
