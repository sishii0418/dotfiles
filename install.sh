#!/bin/bash
# dotfiles/install.sh

ln -si $HOME/dotfiles/init.vim      $XDG_CONFIG_HOME/nvim/init.vim
ln -si $HOME/dotfiles/dein.toml     $XDG_CONFIG_HOME/nvim/dein.toml
ln -si $HOME/dotfiles/deinlazy.toml $XDG_CONFIG_HOME/nvim/deinlazy.toml
ln -si $HOME/dotfiles/.zshrc        $HOME/.zshrc
ln -si $HOME/dotfiles/.tmux.conf    $HOME/.tmux.conf
ln -si $HOME/dotfiles/.Xresources   $HOME/.Xresources
ln -si $HOME/dotfiles/.xinitrc      $HOME/.xinitrc
