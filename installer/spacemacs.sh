#!/usr/bin/env bash

if [ -d "$HOME/.emacs.d" ]; then
  mv ~/.emacs.d ~/.emacs.d.bkp
fi

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

symlink_or_ask ~/.dotfiles/spacemacs ~/.spacemacs
