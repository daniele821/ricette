#!/bin/bash

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/envvars.sh"

for ricetta in "$DIR_RICETTE/"*.md; do
    ricetta="$(realpath "$ricetta")"
    OUTPUT="$(grep -n TODO "$ricetta")"
    if [[ -n $OUTPUT ]]; then
        echo -e "\e[1;33m$ricetta\e[m"
        echo "$OUTPUT"
    fi
done
