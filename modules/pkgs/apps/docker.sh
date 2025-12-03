#!/bin/bash

set -e

echo "Installing docker..."
echo ""

install_pkg "docker" "app-containers/docker"
echo ""
install_pkg "docker" "app-containers/docker-cli"
echo ""

echo "Starting docker service and adding to default..."
echo ""

sudo rc-update add docker default
sudo rc-service docker start
echo ""