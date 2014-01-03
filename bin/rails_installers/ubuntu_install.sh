#!/bin/bash

echo "Installing mysql-client, libmysqlclient-dev and lots of other libs ..."
  sudo apt-get install mysql-client zlib1g-dev libssl-dev libsqlite3-dev libmysqlclient-dev \
    imagemagick librmagick-ruby libxml2-dev libxslt1-dev build-essential openssl \
    libreadline6 libreadline6-dev zlib1g libyaml-dev libsqlite3-0 sqlite3 libxml2-dev \
    libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison libpq-dev libpq5 \
    libmysql-ruby libmysqlclient-dev

echo "Installing curl..."
  sudo apt-get install curl

echo "Installing RVM (Ruby Version Manager) and Latest Ruby, which becomes the default ..."
  curl -L https://get.rvm.io | bash -s stable --ruby

echo "Adding rvm path to the ~/.bashrc file ..."
  source ~/.bash_profile
  echo 'source ~/.bash_profile' >> ~/.bashrc

echo "Installing critical Ruby gems for Rails development ..."
  gem install bundler rails pg foreman thin --no-rdoc --no-ri

