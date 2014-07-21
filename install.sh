#!/bin/bash

# TODO: Check whether the inclusion of .dotfiles/bash_profile exists in either
# ~/.bashrc or ~/.bash_profile and write it otherwise

if [ -f $HOME/.bash_profile ]; then
    rm $HOME/.bash_profile
    ln -s ~/.dotfiles/bash_profile ~/.bash_profile
fi

if [ -f $HOME/.bashrc ]; then
    rm $HOME/.bashrc
    ln -s ~/.dotfiles/bash_profile ~/.bashrc
fi


# git config
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global


# tmux config
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/irbrc ~/.irbrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/ctags ~/.ctags
ln -s ~/.dotfiles/agignore ~/.agignore

# install vundle
cd ~/.vim/ && git clone https://github.com/gmarik/Vundle.vim.git
