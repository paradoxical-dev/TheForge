#!/bin/bash

set -e

echo "Installing docker..."
echo ""

install_pkg "docker" "app-containers/docker"
echo ""
install_pkg "docker" "app-containers/docker-cli"
echo ""

echo "Adding $USER to docker group..."
echo ""

sudo usermod -aG docker "$USER"

echo "Starting docker service and adding to default..."
echo ""

# sudo rc-update add docker default
# sudo rc-service docker start
sudo systemctl enable docker.service
sudo systemctl start docker.service
echo ""
