#!/bin/bash

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

mecho "Installing silversearcher-ag, tmux"
  sudo apt-get install silversearcher-ag tmux
