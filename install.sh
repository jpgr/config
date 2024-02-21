#!/usr/bin/env bash
set +e

BASE_PATH=`readlink -f $(dirname $(pwd)/$0)`
START="\e[1;32m::\e[0m "


install_link () {
  TARGET=$1
  LINK=$2
  if [ -L $LINK ]; then
    OLD_LINK=`readlink -f $LINK`
    if [ $TARGET = $OLD_LINK ]; then
      echo nvim config already installed
    else
      echo $LINK already linked to $OLD_LINK
      echo relink to $TARGET
      rm $LINK
      ln -s $TARGET $LINK
    fi
  elif [ -e $LINK ]; then
    echo $LINK already exist
    echo moving to ${LINK}.old
    mv $LINK ${LINK}.old
    ln -s $TARGET $LINK
  else
    mkdir -p $(dirname $LINK)
    ln -s $TARGET $LINK
  fi
}

echo -e "${START} Installing neovim"
install_link ${BASE_PATH}/nvim ~/.config/nvim

echo -e "${START} Installing alacritty"
install_link ${BASE_PATH}/term/alacritty.toml ~/.config/alacritty/alacritty.toml
