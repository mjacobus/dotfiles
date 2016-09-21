#!/usr/bin/env bash

symlink_or_ask ~/.dotfiles/composer ~/.composer

if [ ! -e ~/.dotfiles/bin/composer.phar ]; then
  curl http://getcomposer.org/composer.phar -o ~/.dotfiles/bin/composer.phar
  chmod +x ~/.dotfiles/bin/composer.phar
fi

cd ~/.dotfiles/composer && composer install
cd -
