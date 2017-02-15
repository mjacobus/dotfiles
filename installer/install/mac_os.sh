#!/usr/bin/env bash

set -e

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install tmux
brew install curl
brew install phantomjs
brew install wget


# Ruby install
mkdir -p ~/.opt
cd ~/.opt
wget -O ruby-install-0.6.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz
tar -xzvf ruby-install-0.6.1.tar.gz
cd ruby-install-0.6.1/
sudo make install

# Chruby
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
