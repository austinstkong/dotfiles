#!/bin/bash

dotfileList=("bashrc" "zshrc" "tmux.conf" "vimrc" "gitconfig")

for dotfile in "${dotfileList[@]}"
do
    dotfilePath="$HOME/.${dotfile}"
    if test -f "$dotfilePath"
    then
        echo "File $dotfilePath already exists."
    else
        cp -v "${dotfile}" "$dotfilePath"
    fi
done
