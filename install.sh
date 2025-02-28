#!/bin/env #!/bin/bash

nvim_install() {
  if [ -f ~/.config/nvim ]; then
    echo "Creating nvim config directory"
    mkdir -p ~/.config/nvim
  fi

  if [ -f ~/config/nvim/init.vim ]; then
    echo "A nvim config file already exists. Do you want to overwrite it? (y/n)"
    read -r answer
    if [ "${answer}" == "y" ]; then
      echo ""
      mv ~/.config/nvim ~/.config/nvim.bak
    else
      echo "Ommited nvim config installation."
      exit 1
    fi
  fi
  mv .config/nvim ~/.config/
}

echo "Script for installation of dotfiles on Arch Linux. Soon"
