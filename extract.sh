#!/usr/bin/env bash

# Executable made for copying the files automatically
# also don't execute this outside the root dir of the repository

cp ~/.config/nvim/init.vim .config/nvim
cp -r ~/.config/nvim/plug-config/ .config/nvim

cp ~/.tmux.conf .

cp ~/.config/fish/config.fish .config/fish
