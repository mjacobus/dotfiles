#!/bin/bash

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

mecho "Installing silversearcher-ag, tmux, ctags"
  sudo apt-get install silversearcher-ag tmux ctags

# you complete me requirements
# https://github.com/Valloric/YouCompleteMe
mecho "Installing build-essential cmake"
  sudo apt-get install build-essential cmake

mecho "Installing python-dev"
  sudo apt-get install python-dev
