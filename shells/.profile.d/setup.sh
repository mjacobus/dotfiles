# vi: set ft=sh :

# if [ "$PROFILE_INCLUDED" != "" ]; then
#   return
# fi

# if [ -n "$DOTFILES_SHELL_LOADED"  ]; then
#   return
# fi

# export DOTFILES_SHELL_LOADED=1

if [ -n "$BASH_VERSION"  ]; then
  SHELL_IS_BASH=1
fi

if [ -n "$ZSH_VERSION"  ]; then
  SHELL_IS_ZSHELL=1
fi

export PROFILE_INCLUDED=1

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" >/dev/null
  ssh-add ~/.ssh/id_rsa >/dev/null 2>&1
fi

if [[ "$SHELL_IS_ZSHELL" ]]; then
  for file in `ls ~/.profile.d/zshell/*.conf`; do
    file=`basename $file`
    source ~/.profile.d/zshell/$file
  done
fi

if [[ "$SHELL_IS_BASH" ]]; then
  for file in `ls ~/.profile.d/bash/*.conf`; do
    file=`basename $file`
    source ~/.profile.d/bash/$file
  done
fi

if [[ -d ~/.profile.d ]]; then
  for file in `ls ~/.profile.d/*.conf`; do
    file=`basename $file`
    source ~/.profile.d/$file
  done
fi

if [[ -d ~/.profile.d.local ]]; then
  for file in `ls ~/.profile.d.local/*.conf`; do
    file=`basename $file`
    source ~/.profile.d.local/$file
  done
fi
