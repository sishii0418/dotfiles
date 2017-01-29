#!/bin/bash
# dotfiles/install.sh

# NOTE: run at ~/dotfiles
ln -si ./init.vim       $XDG_CONFIG_HOME/nvim/init.vim
ln -si ./dein.toml      $XDG_CONFIG_HOME/nvim/dein.toml
ln -si ./deinlazy.toml  $XDG_CONFIG_HOME/nvim/deinlazy.toml
ln -si ./.zshrc         ~/.zshrc
ln -si ./.tmux.conf     ~/.tmux.conf
ln -si ./.Xresources    ~/.Xresources
