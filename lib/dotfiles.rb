# frozen_string_literal: true

require 'dotfiles/version'
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

module Dotfiles
end
