#!/usr/bin/env bash

BASE_PATH=`readlink -f $(dirname $(pwd)/$0)`
START="\e[1;32m::\e[0m "

echo -e "${START} Installing neovim"
TARGET=${BASE_PATH}/nvim
if [ -L ~/.config/nvim ]; then
  OLD_LINK=`readlink -f ~/.config/nvim`
  if [ $TARGET = $OLD_LINK ]; then
    echo nvim config already installed
  else
    echo ~/.config/nvim already linked to ${OLD_LINK}
    echo relink to ${TARGET}
    rm ~/.config/nvim
    ln -s ${TARGET} ~/.config/nvim
  fi
elif [ -d ~/.config/nvim ]; then
  echo directory ~/.config/nvim already exist
  echo moving to ~/.config/nvim.old
  mv ~/.config/nvim ~/.config/nvim.old
  ln -s ${TARGET} ~/.config/nvim
elif [ -f ~/.config/nvim ]; then
  echo file ~/.config/nvim already exist
  echo moving to ~/.config/nvim.old
  mv ~/.config/nvim ~/.config/nvim.old
  ln -s ${TARGET} ~/.config/nvim
else
  ln -s ${TARGET} ~/.config/nvim
fi

