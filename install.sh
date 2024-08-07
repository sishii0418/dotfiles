#!/bin/bash
# dotfiles/install.sh
export XDG_CONFIG_HOME=$HOME/.config

# if not exist, create a .config directory
if [ ! -d $XDG_CONFIG_HOME ]; then
	mkdir $XDG_CONFIG_HOME
fi
# if not exist, create a .config/nvim directory
if [ ! -d $XDG_CONFIG_HOME/nvim ]; then
	mkdir $XDG_CONFIG_HOME/nvim
fi

ln -si $HOME/dotfiles/init.vim      $XDG_CONFIG_HOME/nvim/init.vim
ln -si $HOME/dotfiles/dein.toml     $XDG_CONFIG_HOME/nvim/dein.toml
ln -si $HOME/dotfiles/deinlazy.toml $XDG_CONFIG_HOME/nvim/deinlazy.toml
ln -si $HOME/dotfiles/.zshrc        $HOME/.zshrc
ln -si $HOME/dotfiles/.tmux.conf    $HOME/.tmux.conf
ln -si $HOME/dotfiles/.Xresources   $HOME/.Xresources
ln -si $HOME/dotfiles/.xinitrc      $HOME/.xinitrc
ln -si $HOME/dotfiles/.latexmkrc    $HOME/.latexmkrc

# WSL2用
ln -si $HOME/dotfiles/keymapsForVSCode.vim /mnt/c/Users/sanra/AppData/Roaming/Code/User/keymapsForVSCode.vim
