#!/bin/bash

SCRIPTS=`dirname $0`

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

function install() {
  mecho "Installing $@"
  sudo apt-get install -y $@
}
