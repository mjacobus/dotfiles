# frozen_string_literal: true

module Dotfiles
  class Installer
    def initialize(installers)
      @installers = installers
    end

    def install(_argv)
      @installers.map(&:install)
    end
  end
end
