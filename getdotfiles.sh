#!/bin/bash

prefix='austin'

dotfileList=("bashrc" "zshrc" "tmux.conf" "vimrc" "gitconfig")


for dotfile in "${dotfileList[@]}"
do
    dotfilePath="$HOME/.${dotfile}"
    if test -f "$dotfilePath"
    then
        cp -v "$dotfilePath" "${prefix}.${dotfile}"
    else
        echo "Could not find $dotfilePath"
    fi
done
