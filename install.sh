#!/bin/sh

ln -iTs $(readlink -en $(dirname "$0")) ~/.vim

response=n

if [ -e ~/.vimrc ]; then
    echo -n 'Replace current ~/.vimrc? '
    read response
    response=$(echo -n "$response" | tr A-Z a-z)
fi

if [ "$response" = 'y' -o "$response" = "Y" ]; then
    echo 'runtime vimrc/main.vim' >~/.vimrc
fi
