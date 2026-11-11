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
# if not exist, create a .config/zed directory
if [ ! -d $XDG_CONFIG_HOME/zed ]; then
	mkdir $XDG_CONFIG_HOME/zed
fi

ln -s $HOME/dotfiles/init.vim      $XDG_CONFIG_HOME/nvim/init.vim
ln -s $HOME/dotfiles/dein.toml     $XDG_CONFIG_HOME/nvim/dein.toml
ln -s $HOME/dotfiles/deinlazy.toml $XDG_CONFIG_HOME/nvim/deinlazy.toml
ln -s $HOME/dotfiles/keymap.json $XDG_CONFIG_HOME/zed/keymap.json
ln -s $HOME/dotfiles/.zshrc        $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux.conf    $HOME/.tmux.conf
ln -s $HOME/dotfiles/.Xresources   $HOME/.Xresources
ln -s $HOME/dotfiles/.xinitrc      $HOME/.xinitrc
ln -s $HOME/dotfiles/.latexmkrc    $HOME/.latexmkrc
ln -s $HOME/dotfiles/.radian_profile    $HOME/.radian_profile

# WSL2用
if uname -r | grep -qi 'microsoft'; then
	ln -s $HOME/dotfiles/keymapsForVSCode.vim /mnt/c/Users/sanra/AppData/Roaming/Code/User/keymapsForVSCode.vim
	ln -s $HOME/dotfiles/keymap.json /mnt/c/Users/sanra/AppData/Roaming/Zed/keymap.json
fi
