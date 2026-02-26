#!/bin/bash

set -e

echo "Installing gnuplot..."
echo ""

edit_use "gnuplot" "sci-visualization/gnuplot" "cairo"

install_pkg "gnuplot" "sci-visualization/gnuplot"
echo ""
