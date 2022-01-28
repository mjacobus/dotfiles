#!/bin/bash

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

function install() {
  mecho "Installing $@..."
  sudo yum install -y "$@"
}

# install nvim
# install python3-pip
# install python3-devel
# install xclip
install vim-enhanced
install git git-svn
install tmux
install curl
install httpie
install zsh
install ctags-etags
install the_silver_searcher
install yum install binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms
install php
install php-mbstring php-xml php-mysql php-pdo php-mcrypt php-mbstring php-gd php-pecl-xdebug.x86_64
# nice to have php extensions according to composer
install mysql-devel
install php-soap.x86_64
install php-pdo.x86_64
install php-intl
# install php-pclzip.noarch
install php-pecl-zip.x86_64
install postgresql-devel
install nodejs
install npm

mecho "Installing composer..."
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/bin
  sudo ln -fs /usr/bin/composer.phar /usr/bin/composer


mecho "Setting up zshell as primary shell"
  chsh -s `which zsh`

mecho "Installing RVM (Ruby Version Manager) and Latest Ruby, which becomes the default ..."
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable --ruby

mecho "Installing critical Ruby gems for Rails development ..."
  gem install bundler vagrant rails pg foreman thin --no-rdoc --no-ri


# GOOD TO HAVE
  # - Virtual box
#----------------------------

# instal mysql-client zlib1g-dev libssl-dev libsqlite3-dev libmysqlclient-dev \
#     imagemagick librmagick-ruby libxml2-dev libxslt1-dev build-essential openssl \
#     libreadline6 libreadline6-dev zlib1g libyaml-dev libsqlite3-0 sqlite3 libxml2-dev \
#     libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison libpq-dev libpq5 \
#     libmysql-ruby libmysqlclient-dev
#
# mecho "Installing mysql-server..."
#   sudo yum install -y mysql-server mysql-client
#
# mecho "Installing curl, php-curl..."
#   sudo yum install -y curl libcurl3 libcurl3-dev php5-curl
#
# mecho "Installing php5..."
#   sudo yum install -y php5
#
# mecho "Installing php5-curl..."
#   sudo yum install -y php5-curl
#
# mecho "Installing php5-gd..."
#   sudo yum install -y php5-gd
#
# mecho "Installing php5-mysql mysql"
#   sudo yum install -y php5-mysql
#
# mecho "Installing php5-intl"
#   sudo yum install php5-intl
#
# mecho "Installing php5-xsl"
#   sudo yum install php5-xsl
#
# mecho "Installing php5-dev, pear, xdebug..."
#   sudo yum install -y php5-dev php-pear
#   sudo pecl install xdebug
#   XDEBUG_PATH=`find /usr/lib/php5 -name xdebug.so`
#   XDEBUG_CONF_PATH=/etc/php5/mods-available/xdebug.ini
#   sudo echo "zend_extension=$XDEBUG_PATH" > /tmp/xdebug.ini
#   sudo mv /tmp/xdebug.ini $XDEBUG_CONF_PATH
#   sudo ln -s $XDEBUG_CONF_PATH /etc/php5/apache2/conf.d/30-xdebug.ini
#   sudo ln -s $XDEBUG_CONF_PATH /etc/php5/cli/conf.d/30-xdebug.ini
#
# mecho "Installing composer..."
#   curl -sS https://getcomposer.org/installer | php
#   sudo mv composer.phar /usr/bin
#   sudo ln -s /usr/bin/composer.phar /usr/bin/composer
#
#
# mecho "Installing silversearcher-ag, tmux, ctags"
#   sudo yum install -y silversearcher-ag tmux ctags
#
# mecho "Installing build-essential cmake"
#   sudo yum install -y build-essential cmake
#
# mecho "Installing python-dev"
#   sudo yum install -y python-dev
#
# mecho "Installing zshell..."
#   sudo yum install -y zsh
#
# mecho "Installing oh-my-zsh..."
#   wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
#
# mecho "Setting shell to zshell..."
#   chsh -s `which zsh`
#
