My .dotfiles
--------------

WARNING: Installation is weird at the moment. I need to fix it.

### Instalation

If you are not me (skips personal config):

```bash
bash <(curl https://raw.githubusercontent.com/mjacobus/.dotfiles/master/install.sh)
```

If you are me:

First of all, good for you! We are awesome!

```bash
bash <(curl https://raw.githubusercontent.com/mjacobus/.dotfiles/master/install_mjacobus.sh)
```

### Custom installation

```
git clone https://github.com/mjacobus/.dotfiles.git ~/.dotfiles

cd ~/.dotfiles

./install all
```

Or:


```
./install vim
```

For a list of available installers, refer to [this directory](https://github.com/mjacobus/.dotfiles/tree/master/installer).

### Additional info

Here you will find (among other configs):

- [VIM](vim/README.md)
- [TMUX](tmux/README.md)

### Ctags

- Use patched ctags. See this [link](https://github.com/shawncplus/phpcomplete.vim/wiki/Patched-ctags)

### Note to self:

Installation scripts before the ruby refactoring can be found [here](https://github.com/mjacobus/.dotfiles/tree/42ee48f4b57e3d3e69e547434da20e111ddb08df/installer)
