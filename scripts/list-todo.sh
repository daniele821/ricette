#!/bin/bash

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/.envvars.sh"

for ricetta in "$DIR_RICETTE/"*.md; do
    ricetta="$(realpath "$ricetta")"
    ricetta_name="$(basename "$ricetta")"
    OUTPUT="$(grep -n TODO "$ricetta")"
    TODOS="$(echo "$OUTPUT" | wc -l)"
    if [[ -n $OUTPUT ]]; then
        echo -e "\e[1;31m- $ricetta_name: $TODOS $SYMBOL_WRONG\e[m"
        echo "$OUTPUT"
    else
        echo -e "\e[1;32m- $ricetta_name: 0 $SYMBOL_CORRECT\e[m"
    fi
done
