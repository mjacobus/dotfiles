#!/usr/bin/env bash

# Works on Ubuntu 16.4

# https://github.com/shawncplus/phpcomplete.vim/wiki/Getting-better-tags

source "`dirname $0`/config.sh"

set -e

wget "https://github.com/shawncplus/phpcomplete.vim/raw/master/misc/ctags-5.8_better_php_parser.tar.gz" -O /tmp/ctags-5.8_better_php_parser.tar.gz

cd /tmp

tar xvf ctags-5.8_better_php_parser.tar.gz

cd ctags

autoreconf -fi

./configure

make

sudo make install

sudo mv /usr/local/bin/ctags /usr/local/bin/ctags-patched
sudo ln -s /usr/local/bin/ctags-patched /us/local/bin/ctags
