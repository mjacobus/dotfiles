#!/bin/bash

set -e

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

mecho "Installing vim..."
  sudo apt-get install -y vim

mecho "Installing xclip..."
  sudo apt-get install -y xclip

mecho "Installing neovim..."
  sudo add-apt-repository -y ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get -y install neovim
  sudo apt-get -y install python3-pip

mecho "Installing vim-gnome..."
  sudo apt-get install -y vim-gnome

mecho "Installing git..."
  sudo apt-get install -y git

mecho "Installing mysql-server..."
  sudo apt-get install -y mysql-server mysql-client

mecho "Installing curl, php-curl, httpie..."
  # sudo apt-get install -y curl libcurl3 libcurl3-dev php7.0-curl httpie

mecho "Installing php7.0..."
  sudo apt-get install -y php7.0

mecho "Installing php7.0-curl..."
  sudo apt-get install -y php7.0-curl

mecho "Installing php7.0-gd..."
  sudo apt-get install -y php7.0-gd

mecho "Installing php7.0-mysql mysql"
  sudo apt-get install -y php7.0-mysql

mecho "Installing php7.0-intl"
  sudo apt-get install php7.0-intl

mecho "Installing php7.0-xsl"
  sudo apt-get install php7.0-xsl

# mecho "Installing php7.0-dev, pear, xdebug..."
  wget -O /tmp/xdebug-2.4.0.tgz http://xdebug.org/files/xdebug-2.4.0.tgz
  cd /tmp && sudo tar xzvf xdebug-2.4.0
  cd xdebug-2.4.0
  phpize
  ./configure
  make
  sudo cp modules/xdebug.so /usr/lib/php/20151012

#  http://php-built.com/installing-xdebug-for-php7/

#   sudo apt-get install -y php7.0-dev php-pear
#   sudo pecl install xdebug
#   XDEBUG_PATH=`find /usr/lib/php/7.0 -name xdebug.so`
#   XDEBUG_CONF_PATH=/etc/php/7.0/mods-available/xdebug.ini
#   sudo echo "zend_extension=$XDEBUG_PATH" > /tmp/xdebug.ini
#   sudo mv /tmp/xdebug.ini $XDEBUG_CONF_PATH
#   sudo ln -s $XDEBUG_CONF_PATH /etc/php/7.0/apache2/conf.d/30-xdebug.ini
#   sudo ln -s $XDEBUG_CONF_PATH /etc/php/7.0/cli/conf.d/30-xdebug.ini

mecho "Installing composer..."
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/bin
  sudo ln -s /usr/bin/composer.phar /usr/bin/composer


mecho "Installing silversearcher-ag, tmux, ctags"
  sudo apt-get install -y silversearcher-ag tmux ctags

mecho "Installing build-essential cmake"
  sudo apt-get install -y build-essential cmake

mecho "Installing python-dev"
  sudo apt-get install -y python-dev

mecho "Installing zshell..."
  sudo apt-get install -y zsh

mecho "Installing oh-my-zsh..."
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

mecho "Setting shell to zshell..."
  chsh -s `which zsh`

