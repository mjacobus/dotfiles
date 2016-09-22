My .dotfiles
--------------

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

./install.sh all
```

Or:


```
./install.sh vim
```

For a list of available installers, refer to [this directory](https://github.com/mjacobus/.dotfiles/tree/master/installer).

### Additional info

Here you will find (among other configs):

- [VIM](vim/README.md)
- [TMUX](tmux/README.md)

### Ctags

- Use patched ctags. See this [link](https://github.com/shawncplus/phpcomplete.vim/wiki/Patched-ctags)
