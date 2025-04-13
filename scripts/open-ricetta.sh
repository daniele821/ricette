#!/bin/bash

VIEWER=""
if command -v bat &>/dev/null; then
    VIEWER='bat'
elif command -v batcat &>/dev/null; then
    VIEWER='batcat'
elif command -v cat &>/dev/null; then
    VIEWER='cat'
else
    echo 'no file viewer command found! Try installing cat or bat...'
    exit 1
fi

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/.envvars.sh"

cd "${DIR_RICETTE}" || exit 1
"$VIEWER" "$(fzf --height=40% --layout=reverse --border)"
