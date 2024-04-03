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
      echo config already linked
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

echo -e "${START} Installing git-prompt"
install_link ${BASE_PATH}/shell/git-prompt.sh ~/.local/share/git-prompt.sh

echo -e "${START} Installing bashrc"
install_link ${BASE_PATH}/shell/.bashrc ~/.bashrc

echo -e "${START} Installing neovim config"
install_link ${BASE_PATH}/nvim ~/.config/nvim

echo -e "${START} Installing alacritty config"
install_link ${BASE_PATH}/term/alacritty.toml ~/.config/alacritty/alacritty.toml

echo -e "${START} Installing lazygit config"
install_link ${BASE_PATH}/tools/lazygit.yml ~/.config/lazygit/config.yml

echo -e "${START} Installing fzf config"
install_link ${BASE_PATH}/tools/fzf.bash ~/.config/fzf.bash

echo -e "${START} Installing tmux config"
install_link ${BASE_PATH}/term/.tmux.conf ~/.tmux.conf

echo -e "${START} Installing wezterm config"
install_link ${BASE_PATH}/term/wezterm.lua ~/.wezterm.lua

