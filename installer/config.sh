#!/usr/bin/env bash

ask_should_symlink() {
  while true; do
    read -p "Do you want to symlink $1 to $2 ? " yn
    case $yn in
      [Yy]* ) symlink_safe $1 $2; break;;
      [Nn]* ) return ;;
      * ) echo "Please answer yes or no.";
    esac
  done
}

symlink_or_ask() {
  if [ -L $2 ]; then
    echo "$2 is already linked to $2"
  elif [ -d $2 ]; then
    ask_should_symlink $1 $2
  elif [ -f $2 ]; then
    ask_should_symlink $1 $2
  else
    ln -s $1 $2
  fi
}

backup_move() {
  SCRIPT_TIME=`date +%Y%m%d%H_%M_%S`
  mv $1 "${1}_${SCRIPT_TIME}"
}

symlink_safe() {
  echo "symlinking $1 to $2"
  if [ -f $2 ]; then
    backup_move $2 && ln -sf $1 $2
  else
    ln -sf $1 $2
  fi
}

dotfile_install() {
  local file=$1
  echo "--------------------------------------------------------------------------------"
  echo "Installing ${1} configs..."
  echo "--------------------------------------------------------------------------------"
  source ~/.dotfiles/installer/${file}.sh
}
