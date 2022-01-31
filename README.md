My .dotfiles
--------------

[![Build Status](https://travis-ci.org/mjacobus/.dotfiles.svg?branch=master)](https://travis-ci.org/mjacobus/.dotfiles)
[![Maintainability](https://api.codeclimate.com/v1/badges/227148a60543cbdf3c49/maintainability)](https://codeclimate.com/github/mjacobus/.dotfiles/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/mjacobus/.dotfiles/badge.svg?branch=master)](https://coveralls.io/github/mjacobus/.dotfiles?branch=master)


### Installation

First off, rename or remove the following files:

```
~/.bashrc
~/.zshrc
```

```
git clone https://github.com/mjacobus/dotfiles ~/.dotfiles
cd ~/.dotfiles
git submodules update
./install
```

### (Some) docs

Here you will find (among other configs):

- [VIM](vim/README.md)
- [TMUX](tmux/README.md)

### Ctags

- Use patched ctags. See this [link](https://github.com/shawncplus/phpcomplete.vim/wiki/Patched-ctags)

### Note to self:

- Installation scripts before the ruby refactoring can be found [here](https://github.com/mjacobus/.dotfiles/tree/42ee48f4b57e3d3e69e547434da20e111ddb08df/installer)
- Installation before stow can be found [here](https://github.com/mjacobus/dotfiles/tree/ed6b3a986e2551d999112134fd5d12d8434118d4)
