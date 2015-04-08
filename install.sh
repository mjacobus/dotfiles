#!/bin/bash

# TODO: Check whether the inclusion of .dotfiles/bash_profile exists in either
# ~/.bashrc or ~/bashrc and write it otherwise

ln -sf ~/.dotfiles/bashrc ~/.bash_profile
ln -sf ~/.dotfiles/bashrc ~/.bashrc

# git config
ln -sf ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global


# tmux config
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/irbrc ~/.irbrc
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
# vim mode for jet brains editor
ln -sf ~/.dotfiles/vim/ideavimrc ~/.ideavimrc
ln -sf ~/.dotfiles/vim/gvimrc ~/.gvimrc
ln -sf ~/.dotfiles/ctags ~/.ctags
ln -sf ~/.dotfiles/agignore ~/.agignore
ln -sf ~/.dotfiles/composer ~/.composer

# install vundle
cd ~/.vim/ && git clone https://github.com/gmarik/Vundle.vim.git
vim +BundleInstall +BundleClean +BundleClean +quitall

cd ~/.dotfiles/composer && composer install
cd -
