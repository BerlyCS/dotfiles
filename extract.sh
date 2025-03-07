#!/usr/bin/env bash

# Executable made for copying the files automatically

cp ~/.config/nvim/init.vim .config/nvim
cp -r ~/.config/nvim/plug-config/ .config/nvim

cp ~/.tmux.conf .

cp ~/.config/fish/config.fish .config/fish

cp ~/.config/waybar/config .config/waybar
cp ~/.config/waybar/style.css .config/waybar

cp ~/.config/sway/config .config/sway

cp ~/.config/wofi/config .config/wofi/
cp ~/.config/wofi/style.css .config/wofi/
