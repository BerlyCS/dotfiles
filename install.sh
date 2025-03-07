#!/usr/bin/env bash

dependencies_install() {
  if [[ -x /usr/bin/yay ]]; then
    yay -Sy sway swaybg swaync wofi rofi waybar swayfx tmux neovim fish 
}

nvim_install() {
  if [ -f ~/.config/nvim ]; then
    echo "Creating nvim config directory"
    mkdir -p ~/.config/nvim
  fi

  if [ -f ~/config/nvim/init.vim ]; then
    echo -n "A nvim config directory already exists. Do you want to move [.config/nvim.old] (m), skip (s) or overwrite (o) the folder ~/.config/nvim: "
    read -r answer
    if [ "${answer}" == "m" ]; then
      echo "Moving to $HOME/.config/nvim.old"
      mv "$HOME/.config/nvim" "$HOME/.config/nvim.old"

    elif [ "${answer}" == "s" ]; then
      echo "Neovim installation skipped"
      exit

    elif [ "${answer}" == "o" ]; then
      echo "Overwriting directory $HOME/.config/nvim"
      mv .config/nvim "${HOME}/.config/nvim"

    fi
  else

    mv .config/nvim "$HOME/.config/nvim"
  fi
}

echo "Script for installation of dotfiles on Arch Linux. Soon"
