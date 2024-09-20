# vi: set ft=sh :
#
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kafeitu"

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
#
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	1password
	bundler
	composer
	docker
	docker-compose
	git
	git-extras
	gitfast
	tmux
	urltools
	vi-mode
	web-search
	rake-fast
	jira
)

if [[ -d $ZSH ]]; then
	source $ZSH/oh-my-zsh.sh
else
	echo "---------------------------------------------"
	echo "Run install-oh-my-zsh to install oh my zsh"
	echo "---------------------------------------------"
fi

# Bind the reverse search to ctrl + R
bindkey -v
# bindkey ^R history-incremental-search-backward
# http://unix.stackexchange.com/questions/101182/bind-key-sequence-to-escape-zsh
bindkey jj vi-cmd-mode
