# Aliases.
alias l='ls -alF'

alias dotfiles='cd ~/.dotfiles'

# git
alias gs='git status -s'
alias gc='git commit'
alias gp='git push origin'
alias gpr='git pull --rebase'
alias gprm='git pull --rebase origin master'
alias gpu='git pull'
alias gdc='git diff --cached'

# php
alias phpunit='./vendor/bin/phpunit'
alias php-cs-fixer='./vendor/bin/php-cs-fixer'
alias phpmd='./vendor/bin/phpmd'
alias t='phpunit'

# ruby
alias carrasco='bundle exec carrasco'
alias cap='bundle exec cap'

alias ag=$(which ag)

# conditional alias
which vim.gnome > /dev/null 2>&1 && alias vim=vim.gnome
which mvim > /dev/null 2>&1 && alias vim='mvim -v'
which mvim > /dev/null 2>&1 && alias gvim='mvim -v'
which gvim > /dev/null 2>&1 && alias vim='gvim -v'
which gvim > /dev/null 2>&1 && alias gvim='gvim -v'
which nvim > /dev/null 2>&1 && alias vim=nvim

