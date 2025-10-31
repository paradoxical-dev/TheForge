#!/bin/bash

set -e

vendor_choices=(
    "intel"
    "amd"
    "nvidia"
)
header="Choose your GPU vendor(s). Select all that apply"
gpu_vendors=$(choose_multi "$header" "${vendor_choices[@]}")

echo -e "${green}Selected GPU(s): ${gpu_vendors[@]}${color_end}"
echo ""

SCRIPT_PATH="$REPO_DIR/modules/drivers/graphics"

for vendor in $gpu_vendors; do
    "$SCRIPT_PATH/$vendor.sh"
done
