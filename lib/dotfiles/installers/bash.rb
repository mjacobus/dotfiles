# frozen_string_literal: true

module Dotfiles
  module Installers
    class Bash < BaseInstaller
      def name
        'bash configuration'
      end

      private

      def perform_installation
        symlink(dotfile('profile.d'), destination_for('.profile.d'))
        symlink(dotfile('shell_setup.conf'), destination_for('.bash_profile'))
        symlink(dotfile('shell_setup.conf'), destination_for('.bashrc'))
      end
    end
  end
end
