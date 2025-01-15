#!/bin/bash

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/envvars.sh"

cd "${DIR_RICETTE}" || exit 1
bat "$(fzf --height=40% --layout=reverse --border)"
