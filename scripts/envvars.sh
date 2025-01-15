#!/bin/bash

SCRIPT_PWD="$(realpath "${BASH_SOURCE[0]}")"
DIR_ROOT="$(realpath "$(dirname "${SCRIPT_PWD}")/..")"
DIR_RICETTE="$(realpath "$DIR_ROOT"/ricette)"

export DIR_ROOT DIR_RICETTE

# COPY AND PASTE THE FOLLOWING LINE TO USE THIS SCRIPT!
# source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/envvars.sh"
