#!/bin/bash

if command -v bat &>/dev/null; then
    VIEWER='bat'
elif command -v batcat &>/dev/null; then
    VIEWER='batcat'
else
    echo 'no file viewer command found! Try installing bat...'
    exit 1
fi

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/.envvars.sh"

for ricetta in "$DIR_RICETTE/"*.md; do
    ricetta="$(realpath "$ricetta")"
    ricetta_name="$(basename "$ricetta")"
    OUTPUT="$(grep -n TODO "$ricetta")"
    TODOS="$(echo "$OUTPUT" | wc -l)"
    if [[ -n $OUTPUT ]]; then
        echo -e "\e[1;31m- $ricetta_name: $TODOS $SYMBOL_WRONG\e[m"
        "$VIEWER" "$ricetta" --color=always "$(grep -n TODO "$ricetta" | cut -d: -f1 | while read -r line; do echo --highlight-line="$line"; done)"
    else
        echo -e "\e[1;32m- $ricetta_name: 0 $SYMBOL_CORRECT\e[m"
    fi
done
