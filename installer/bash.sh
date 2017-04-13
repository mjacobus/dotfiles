#!/usr/bin/env bash

if [[ -f ~/.bashrc ]]; then
  echo 'source ~/.profile.d/setup.sh' >> ~/.bashrc
fi

if [[ -f ~/.bash_profile ]]; then
  echo 'source ~/.profile.d/setup.sh' >> ~/.bash_profile
fi

symlink_or_ask ~/.dotfiles/profile.d ~/.profile.d
