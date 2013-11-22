# It allows ctrl S and ctrl Q and ctrl others
# https://gist.github.com/pda/5417593/raw/44d412568d0ae09c4c32bef31745cc1283c638a0/vim.zsh
vim() {
  # Save current stty options.
  local STTYOPTS="$(stty -g)"

  # Disable intercepting of ctrl-s and ctrl-q as flow control.
  stty stop '' -ixoff -ixon

  # Execute vim.
  vim_command "$@"

  # Restore saved stty options.
  stty "$STTYOPTS"

}

vim_command() {
  if (( $+commands[reattach-to-user-namespace]  )); then
    # See: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
    command reattach-to-user-namespace vim "$@"
  else
    command vim "$@"
  fi
}
