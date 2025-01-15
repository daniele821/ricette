#!/bin/bash

SCRIPT_PWD="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "${SCRIPT_PWD}")"

for ricetta in "${SCRIPT_DIR}"/../*.md; do
    ricetta="$(realpath "$ricetta")"
    OUTPUT="$(grep -n TODO "$ricetta")"
    if [[ -n $OUTPUT ]]; then
        echo -e "\e[1;33m$ricetta\e[m"
        echo "$OUTPUT"
    fi
done
