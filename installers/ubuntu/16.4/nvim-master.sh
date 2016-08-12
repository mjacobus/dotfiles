#!/usr/bin/env bash

echo "ABORTED: WIP, do not use it!"

exit 1


# for compiling it: https://github.com/neovim/neovim/wiki/Building-Neovim

set -e

sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

rm -rf /tmp/neovim
git clone https://github.com/neovim/neovim /tmp/
cd /tmp/neovim
make
