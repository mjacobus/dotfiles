# vi: set ft=sh :

if [ "$PROFILE_INCLUDED" != "" ]; then
  echo 'haa'
  # return
fi

export PROFILE_INCLUDED=1

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
