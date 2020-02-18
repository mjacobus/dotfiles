# frozen_string_literal: true

module Dotfiles
  module Installers
    class Tmux < BaseInstaller
      def name
        'tmux configuration'
      end

      private

      def perform_installation
        file = destination_for('.tmux.conf')
        symlink(dotfile('tmux/tmux.conf'), file)

        file = destination_for('.tmux-osx.conf')
        symlink(dotfile('tmux/tmux-osx.conf'), file)
      end
    end
  end
end
