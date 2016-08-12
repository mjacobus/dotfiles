#!/usr/bin/env bash

set -e

# https://github.com/neovim/neovim/wiki/Installing-Neovim

# sudo apt-get install software-properties-common
#
# sudo apt-get install python-software-properties
#
# sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get update
# sudo apt-get install neovim

sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo apt-get install python-dev python-pip python3-dev
sudo apt-get install python3-setuptools
sudo easy_install3 pip

pip2 install neovim
pip2 install --upgrade neovim

pip3 install neovim
pip3 install --upgrade neovim
