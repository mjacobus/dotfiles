#!/usr/bin/env bash

if [ ! -e ~/.dotfiles/bin/composer.phar ]; then
  curl http://getcomposer.org/composer.phar -o ~/.dotfiles/bin/composer.phar
  chmod +x ~/.dotfiles/bin/composer.phar
fi

symlink_or_ask ~/.dotfiles/composer ~/.composer


cd ~/.dotfiles/composer && ~/.dotfiles/bin/./composer.phar install
cd -

curl -Ss http://vim-php.com/phpctags/install/phpctags.phar > ~/.dotfiles/bin/phpctags.phar
