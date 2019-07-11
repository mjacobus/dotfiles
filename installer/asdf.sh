#!/usr/bin/env bash

set -e

symlink_or_ask ~/.dotfiles/asdfrc ~/.asdfrc
symlink_or_ask ~/.dotfiles/.tools-versions ~

if [ ! -d ~/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
fi

source ~/.profile.d/asdf.conf

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
