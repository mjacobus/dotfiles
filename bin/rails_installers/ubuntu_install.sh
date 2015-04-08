#!/bin/bash

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

mecho "Installing mysql-client, libmysqlclient-dev and lots of other libs ..."
  sudo apt-get install mysql-client zlib1g-dev libssl-dev libsqlite3-dev libmysqlclient-dev \
    imagemagick librmagick-ruby libxml2-dev libxslt1-dev build-essential openssl \
    libreadline6 libreadline6-dev zlib1g libyaml-dev libsqlite3-0 sqlite3 libxml2-dev \
    libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison libpq-dev libpq5 \
    libmysql-ruby libmysqlclient-dev

mecho "Installing curl..."
  sudo apt-get install curl

mecho "Installing RVM (Ruby Version Manager) and Latest Ruby, which becomes the default ..."
  curl -L https://get.rvm.io | bash -s stable --ruby

mecho "Adding rvm path to the ~/.bashrc file ..."
  source ~/.dotfiles/shells/rvm.sh

mecho "Installing critical Ruby gems for Rails development ..."
  gem install bundler rails pg foreman thin --no-rdoc --no-ri

