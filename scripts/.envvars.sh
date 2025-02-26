#!/bin/bash

###################################################################
###### COPY AND PASTE THE FOLLOWING LINE TO USE THIS SCRIPT! ######
# source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/.envvars.sh"
###################################################################

# PATHS
export DIR_ROOT="$(realpath "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/..")"
export DIR_RICETTE="$(realpath "$DIR_ROOT"/ricette)"
export PATH_TEMPLATE="$(realpath "$DIR_ROOT"/template/ricetta-vuota.md)"

# SYMBOLS
export SYMBOL_CORRECT="✔"
export SYMBOL_WRONG=""
