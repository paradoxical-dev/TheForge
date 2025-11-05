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
    if [[ "$vendor" == "nvidia" ]]; then
        gum_confirm "Nvidia selected, use proprietary drivers?"
        use_prop=$?
        if [[ $use_prop -eq 0 ]]; then
            "$SCRIPT_PATH/nvidia.sh"
        else
            "$SCRIPT_PATH/nouveau.sh"
        fi
    else
        "$SCRIPT_PATH/$vendor.sh"
    fi
done
