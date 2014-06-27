# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git debian bundler gitfast rails urltools web-search vi-mode)

# Bind the reverse search to ctrl + R
bindkey -v
bindkey ^R history-incremental-search-backward

# save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

LANG=en_US.utf-8
LANGUAGE=en
CLICOLOR=1 #Colorizes output of ls and others.
EDITOR=vi
VISUAL=$EDITOR
PAGER=less


# disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

source $ZSH/oh-my-zsh.sh

PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
PATH=$HOME/.dotfiles/bin:$PATH
PATH=$HOME/.bin:$PATH
PATH=./vendor/bin:$PATH # for php composer binaries
# PATH=$PATH:$HOME/.rubinius/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# Customize to your needs...

source ~/.dotfiles/aliases
source ~/.dotfiles/zsh/functions.zsh

TERM="screen-256color"

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

# Always work in a tmux session if tmux is installed
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color"  ] && [ $TERM != "screen"  ]; then
    # tmux attach -t hack || tmux new -s hack; exit
  fi
fi
