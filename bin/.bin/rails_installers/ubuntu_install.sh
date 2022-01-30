#!/bin/bash

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

function install () {
  mecho  "installing $1"
  sudo apt-get install -y $1
}

set -e

# fix: install libmysql-ruby
# fix: install librmagick-ruby
# fix: install librmagick-ruby

install autoconf
install automake
install bison
install build-essential
install curl
install imagemagick
install libc6-dev
install libmysqlclient-dev
install libpq-dev
install libpq5
install libreadline6
install libreadline6-dev
install libsqlite3-0
install libsqlite3-dev
install libssl-dev
install libssl-dev
install libtool
install libxml2-dev
install libxslt-dev
install libxslt1-dev
install libyaml-dev
install mysql-client
install ncurses-dev
install openssl
install sqlite3
install zlib1g
install zlib1g-dev
install build-essential
install imagemagick
install libxslt1-dev
install openssl

mecho "Installing RVM (Ruby Version Manager) and Latest Ruby, which becomes the default ..."
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
  curl -sSL https://get.rvm.io | bash -s stable --ruby

mecho "Adding rvm path to the ~/.bashrc file ..."
  source ~/.dotfiles/shells/rvm.sh

mecho "Installing critical Ruby gems for Rails development ..."
  gem install bundler rails pg foreman thin --no-rdoc --no-ri

