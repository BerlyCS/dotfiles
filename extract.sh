#!/usr/bin/env bash

# Executable made for copying the files automatically

#NVIM
cp ~/.config/nvim/init.vim .config/nvim
cp -r ~/.config/nvim/plug-config/ .config/nvim

#TMUX
cp ~/.tmux.conf .

#FISH
cp ~/.config/fish/config.fish .config/fish

#WAYBAR
cp ~/.config/waybar/config .config/waybar
cp ~/.config/waybar/style.css .config/waybar

#SWAY
cp ~/.config/sway/config .config/sway/
cp ~/.config/sway/battery.sh .config/sway/
cp ~/.config/sway/lock.sh .config/sway/

#WOFI
cp ~/.config/wofi/config .config/wofi/
cp ~/.config/wofi/style.css .config/wofi/
