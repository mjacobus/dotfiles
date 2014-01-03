# My Vim configuration

I am trying to use vim for rails development. Here is where I am going to version my vim configuration and gotchas.

## Plugins

* [vim-bundler](http://github.com/tpope/vim-bundler)
* [vim-ruby](http://github.com/vim-ruby/vim-ruby)
* [vim-rails](http://github.com/tpope/vim-rails)
* [ctrlp](http://github.com/kien/ctrlp.vim)
* [emmet-vim](http://github.com/mattn/emmet-vim)
* [vim-coffee-script](http://github.com/kchmck/vim-coffee-script)
* [tlib_vim](http://github.com/tomtom/tlib_vim) # vim-snipmate dependency
* [vim-addon-mw-utils](http://github.com/MarcWeber/vim-addon-mw-utils) # vim-snipmate dependency
* [vim-snipmate](http://github.com/garbas/vim-snipmate)
* [auto-pairs](http:/hub.com/jiangmiao/auto-pairs)
* [vim-rspec](http:/hub.com/thoughtbot/vim-rspec)
* [nerdtree](http:/hub.com/scrooloose/nerdtree)
* [vim-surround](http://github.com/tpope/vim-surround)
* [sparkup](http://github.com/rstacruz/sparkup)
* [tcomment_vim](http://github.com/tomtom/tcomment_vim)
* [vim-fugitive](http://github.com/tpope/vim-fugitive)
* [vim-colors-solarized](http://github.com/altercation/vim-colors-solarized)
* [base16-vim](http://github.com/chriskempson/base16-vim)
* [xml.vim](https://github.com/othree/xml.vim)
* [vim-matchit](https://github.com/tsaleh/vim-matchit)

## Snippets
*[vim-snippets](http://github.com/honza/vim-snippets)


## Installation

```
  cd ~
  mv .vimrc .vimrc.old
  mv .vim .vim.old
  git clone https://github.com/mjacobus/.vim.git
  ln -s .vim/vimrc .vimrc
  cd ~/.vim/ && git submodule init && git submodule update
```

## Key mapping
* Ctrl+s saves document
* Ctrl+t runs spec
* Ctrl+l runs last spec
* Ctrl+n runs nearest spec

## Todo
Take a look at the plugins listed [here](https://github.com/skorks/better-vim-config)
