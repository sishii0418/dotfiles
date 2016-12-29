#!/bin/bash
# dotfiles/install.sh

ln -si dotfiles/init.vim ~/.config/nvim/init.vim
ln -si dotfiles/dein.toml ~/.config/nvim/dein.toml
ln -si dotfiles/deinlazy.toml ~/.config/nvim/deinlazy.toml
ln -si dotfiles/.zshrc ~/.zshrc
ln -si dotfiles/.tmux.conf ~/.tmux.conf
ln -si dotfiles/.Xresources ~/.Xresources
