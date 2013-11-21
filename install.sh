#!/bin/bash

# TODO: Check whether the inclusion of .dotfiles/bash_profile exists in either
# ~/.bashrc or ~/.bash_profile and write it otherwise

# git config
ln -s ./.dotfiles/gitconfig ~/.gitconfig
ln -s ./.dotfiles/gitignore_global ~/.gitignore_global

# tmux config
ln -s ./.dotfiles/.tmux.conf ~/.tmux.conf
