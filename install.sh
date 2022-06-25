#!/bin/bash
# dotfiles/install.sh
export XDG_CONFIG_HOME=$HOME/.config

ln -si $HOME/dotfiles/init.vim      $XDG_CONFIG_HOME/nvim/init.vim
ln -si $HOME/dotfiles/dein.toml     $XDG_CONFIG_HOME/nvim/dein.toml
ln -si $HOME/dotfiles/deinlazy.toml $XDG_CONFIG_HOME/nvim/deinlazy.toml
ln -si $HOME/dotfiles/.zshrc        $HOME/.zshrc
ln -si $HOME/dotfiles/.tmux.conf    $HOME/.tmux.conf
ln -si $HOME/dotfiles/.Xresources   $HOME/.Xresources
ln -si $HOME/dotfiles/.xinitrc      $HOME/.xinitrc
ln -si $HOME/dotfiles/.latexmkrc    $HOME/.latexmkrc
ln -si $HOME/dotfiles/keymapsForVSCode.vim $XDG_CONFIG_HOME/Code/User/keymapsForVSCode.vim