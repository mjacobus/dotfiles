# frozen_string_literal: true

require 'dotfiles/version'
require 'dotfiles/error'
require 'dotfiles/command_runner'
require 'dotfiles/command_error'
require 'dotfiles/command_result'
require 'dotfiles/application_helper'
require 'dotfiles/installer'
require 'dotfiles/installers/base_installer'
require 'dotfiles/installers/ag'
require 'dotfiles/installers/ctags'
require 'dotfiles/installers/irb'
require 'dotfiles/installers/tmux'
require 'dotfiles/installers/git'
require 'dotfiles/installers/vim'
require 'dotfiles/installers/zshell'
require 'dotfiles/installers/bash'
require 'dotfiles/installers/asdf'
require 'dotfiles/installers/php_utils'

module Dotfiles
end
