#!/bin/sh

if ! [ -e ~/.config ]; then
  mkdir ~/.config
fi

if [ -e ~/.config/nvim ]; then
  if [ -L ~/.config/nvim -o -z "$(ls -A $HOME/.config/nvim)" ]; then
    echo -n "$HOME/.config/nvim exists. Would you like to replace it? "
    read response
    if [ $response = 'y' -o $response = 'Y' ]; then
      rm -d ~/.config/nvim
      ln -Ts $(readlink -fn $(dirname "$0")) ~/.config/nvim
    fi
  elif ! [ -L ~/.config/nvim ]; then
    echo "$HOME/.config/nvim is not a symlink and not empty. Figure it out yourself."
  fi
else
  ln -Ts $(readlink -fn $(dirname "$0")) ~/.config/nvim
fi
