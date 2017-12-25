#!/bin/sh

if ! [ -e ~/.config ]; then
  mkdir ~/.config
fi

ln -iTs $(readlink -en $(dirname "$0")) ~/.config/nvim
