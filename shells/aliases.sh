is_installed() {
  type "$1" > /dev/null 2>&1
  return $?
}

function php-cs-fixer() {
  if [ -f ./vendor/bin/php-cs-fixer ]; then
    ./vendor/bin/php-cs-fixer $@
  else
    ~/.dotfiles/composer/vendor/bin/php-cs-fixer
  fi
}

function phpunit() {
  if [ -f ./vendor/bin/phpunit ]; then
    ./vendor/bin/php-cs-fixer $@
  else
    ~/.dotfiles/composer/vendor/bin/phpunit
  fi
}

function changedfiles() {
  git status -s | awk '{print $2}'
}

function rspec() {
  if [ -f ./bin/rspec ]; then
    time ./bin/rspec $@
  elif [ -f ./bin/bundle ]; then
    time ./bin/bundle exec rspec $@
  else
    time bundle exec rspec $@
  fi
}

# function rubocop() {
#   if [ -f ./bin/rubocop ]; then
#     time ./bin/rubocop $@
#   elif [ -f ./bin/bundle ]; then
#     time ./bin/bundle exec rubocop $@
#   else
#     time rubocop
#   fi
# }

function gri() {
  local number=$1
  git rebase -i HEAD~$number
}

# Aliases.
alias l='ls -alF'

alias dotfiles='cd ~/.dotfiles'

# git
alias gc!='git commit --amend'
alias gc='git commit'
alias gca!='git commit -a --amend'
alias gca='git commit -a'
alias gcob='git checkout -b'
alias gdc='gd --cached'
alias gdc='git diff --cached'
alias gp='git push origin'
alias gl='git log'
is_installed current_branch && alias gp='git push origin `current_branch`'
is_installed current_branch && alias gpr='git pull --rebase origin `current_branch`'
alias gpr='git pull --rebase origin'
alias gprm='git pull --rebase origin master'
alias gpu='git pull'
alias gs='git status -s'

# capistrano
alias cpd='cap production deploy'
alias csd='cap staging deploy'


# php
alias phpunit='./vendor/bin/phpunit'
alias behat='./vendor/bin/behat'
alias phpmd='./vendor/bin/phpmd'
alias t='[[ -f tests/phpunit.xml && ! -f phpunit.xml ]] && phpunit -c tests/phpunit.xml || phpunit'

# ruby
alias carrasco='bundle exec carrasco'
alias cap='bundle exec cap'
alias rake='bundle exec rake'

# appears to be a plugin
unalias ag > /dev/null 2>&1
# alias ag=$(which ag)

# conditional alias
is_installed vim.gnome && alias vim=vim.gnome
is_installed mvim      && alias vim='mvim -v'
is_installed mvim      && alias gvim='mvim -v'
is_installed gvim      && alias vim='gvim -v'
is_installed gvim      && alias gvim='gvim -v'
is_installed nvim      && alias vim=nvim
