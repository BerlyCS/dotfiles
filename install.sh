#!/usr/bin/env bash

SKIP_CHECK_DIRECTORY=0
YAY_INSTALLED="false"

check_yay() {
  BIN=$(command -v yay)
  if [ -n "$BIN" ]; then
    YAY_INSTALLED="true"
  fi
}

install_yay() {
  if ! $YAY_INSTALLED; then
    local TEMP_DIR
    echo "Yay is not installed. Installing..."
    TEMP_DIR=$(mktemp -d)
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git "$TEMP_DIR"
    cd "$TEMP_DIR/yay" || exit 1
    makepkg -si
    cd - || exit 1
    rm -rf "$TEMP_DIR"
  else
    echo "Yay is already installed."
  fi
}

#INPUT: targetdir, sourcedir, target
#paths without / at the end
check_dir() {
  if [ -d "$1" ]; then
    echo -n "A $3 config directory already exists. Do you want to move [$2.old] (m), skip (s) or overwrite (o) the folder $1: "
    read -r answer
    if [ "${answer}" == "m" ]; then
      echo "Moving to $1.old"
      mv "$1" "$1.old"
      cp "$2" "$1"

    elif [ "${answer}" == "s" ]; then
      echo "$3 installation skipped"
      exit

    elif [ "${answer}" == "o" ]; then
      echo "Overwriting directory $1"
      cp "$2" "$1"

    else
      echo "Unknown option. Skipping"

    fi
  else
    mkdir -p "$1"
    echo "Installing config of $3"
    cp  "$2" "$1"
  fi
}

fish_install() {
  local PLUGINS
  echo "Installing fish"
  sudo pacman -S --noconfirm fish fisher
  PLUGINS=(
    "jorgebucaran/fisher"
    "ilancosman/tide@v6"
    "jorgebucaran/autopair.fish"
    "patrickf1/fzf.fish"
  )
  echo "Installing Fish plugins..."
  for plugin in "${PLUGINS[@]}"; do
    fish -c "fisher install $plugin"
  done
  #it should prompt the configuration guide for tide
  check_dir "$HOME/.config/fish" ".config/fish" "Fish"
}

nvim_install() {
  echo "Installing dependencies"
  sudo pacman -S --noconfirm neovim nodejs npm 

  check_dir "$HOME/.config/nvim" ".config/nvim" "Neovim"
  # Installation of plugin manager
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  # nvim doc/nvim.doc
}

sway_install() {
  echo "Installing dependencies"
  yay -S --noconfirm swayfx swaymsg swaync slurp waybar grim swappy xdg-desktop-portal-wlr gtklock

  check_dir "$HOME/.config/sway" ".config/sway" "Sway"
}

tmux_install() {
  echo "Installing dependencies for tmux"
  sudo pacman -S --noconfirm tmux
  #different thing xd
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  cp .tmux.conf "$HOME/"
}

echo "Script for installation of dotfiles on Arch Linux. Soon"
check_yay
if [ $? -lt 1 ]; then
  echo "Installing all dotfiles. Proceed? (y/n)"
  read -r R
  if [ "$R" == "y" ] || [ "$R" == "Y" ]; then
    sway_install
    fish_install
    tmux_install
    nvim_install
  fi

else
  for arg in $#[@]; do
    exit
  done
fi

