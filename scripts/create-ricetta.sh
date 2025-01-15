#!/bin/bash

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/envvars.sh"

function ask_name() {
    read -p "Write the name of the ricetta: " -er ricetta_name </dev/tty
    if [[ -z "$ricetta_name" ]]; then
        echo -e '\e[1;31mINVALID RICETTA NAME: nothing was written!\e[m' >/dev/tty
        return 1
    fi
    if ! [[ "$ricetta_name" =~ ^[a-z[:space:]]+$ ]]; then
        echo -e "\e[1;31mINVALID RICETTA NAME: only a-z and space are valid!\e[m" >/dev/tty
        return 1
    fi
    echo "${ricetta_name}.md" | sed 's/[[:space:]]\+/-/g'
    return 0
}

while true; do
    if name="$(ask_name)"; then
        [[ -e "$DIR_RICETTE/$name" ]] || break
        echo -e "\e[1;31mINVALID RICETTA NAME: file name already taken!\e[m" >/dev/tty
    fi
done

# create ricetta
read -p "Are you sure you want to create ricetta $name? " -er answer </dev/tty
if [[ "${answer,,}" != "y" ]]; then
    exit
fi
cp "$PATH_TEMPLATE" "$DIR_RICETTE/$name"

# edit ricetta
read -p "Do you want to edit ricetta $name? " -er answer </dev/tty
if [[ "${answer,,}" != "y" ]]; then
    exit
fi
nvim "$DIR_RICETTE/$name"
