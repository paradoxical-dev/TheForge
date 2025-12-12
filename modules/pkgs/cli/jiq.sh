#!/bin/bash

set -e

echo "Installing jiq..."
echo ""

go install github.com/fiatjaf/jiq/cmd/jiq@latest
echo ""