#!/bin/bash

# TODO: Check whether the inclusion of .dotfiles/bash_profile exists in either
# ~/.bashrc or ~/.bash_profile and write it otherwise

ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/bash_profile ~/.bashrc

# git config
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/gitignore_global ~/.gitignore_global


# tmux config
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/irbrc ~/.irbrc
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/gvimrc ~/.gvimrc
ln -sf ~/.dotfiles/ctags ~/.ctags
ln -sf ~/.dotfiles/agignore ~/.agignore

# install vundle
cd ~/.vim/ && git clone https://github.com/gmarik/Vundle.vim.git
vim +BundleInstall +BundleClean +BundleClean +quitall
