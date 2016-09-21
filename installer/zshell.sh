#!/usr/bin/env bash

symlink_or_ask ~/.dotfiles/shells/zshrc ~/.zshrc

if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# git clone git://github.com/jimmijj/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
