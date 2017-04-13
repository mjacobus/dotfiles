#!/usr/bin/env bash

symlink_or_ask ~/.dotfiles/profile.d ~/.profile.d

if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# git clone git://github.com/jimmijj/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting


if [ ! -d ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

echo 'source ~/.profile.d/setup.sh' >> ~/.zshrc
