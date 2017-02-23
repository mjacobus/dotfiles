#!/usr/bin/env bash

symlink_or_ask ~/.dotfiles/vim ~/.vim
symlink_or_ask ~/.dotfiles/vim/vimrc ~/.vimrc
symlink_or_ask ~/.dotfiles/vim/nvimrc ~/.nvimrc
symlink_or_ask ~/.dotfiles/vim/ ~/.nvim
symlink_or_ask ~/.dotfiles/vim/ideavimrc ~/.ideavimrc
symlink_or_ask ~/.dotfiles/vim/gvimrc ~/.gvimrc

# Fixes nvim config
# https://github.com/neovim/neovim/issues/3499
# https://github.com/ZyX-I/neovim/blob/42047acb4f07c689936b051864c6b4448b1b6aa1/runtime/doc/nvim_from_vim.txt#L12-L18
mkdir -p ~/.config/nvim

if [[ -d ~/.config ]]; then
  symlink_or_ask ~/.nvim ~/.config/nvim
  symlink_or_ask ~/.nvimrc ~/.config/nvim/init.vim
  ~/.config/nvim/init.vim
fi

# install vundle
if [ ! -d ~/.dotfiles/vim/Vundle.vim ]; then
  echo "downloading vundle"
  cd ~/.dotfiles/vim && git clone https://github.com/gmarik/Vundle.vim.git
fi

vim +BundleInstall +BundleClean +BundleClean +quitall

# cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
