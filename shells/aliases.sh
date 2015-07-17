# Aliases.
alias ls='ls --color'
alias l='ls -alF'

# git
alias gs='git status -s'
alias gc='git commit'
alias gp='git push origin'
alias gpr='git pull --rebase'
alias gpu='git pull'

alias dotfiles='cd ~/.dotfiles'

alias ag='/usr/bin/ag'

# conditional alias
which vim.gnome > /dev/null 2>&1 && alias vim=vim.gnome
which nvim > /dev/null 2>&1 && alias vim=nvim
