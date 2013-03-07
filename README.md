And in your ~/.bash_profile:

```bash
if [ -f ~/.dotfiles/bash_profile ]; then
    . ~/.dotfiles/bash_profile
fi


And in your ~/.bashrc:

```bash
if [ -f ~/.dotfiles/bashrc ]; then
    . ~/.dotfiles/bashrc
fi
```