# frozen_string_literal: true

module Dotfiles
  module Installers
    class Ctags < BaseInstaller
      def name
        'ctags configuration'
      end

      private

      def perform_installation
        file = destination_for('.ctags')
        symlink(dotfile('ctags'), file)
      end
    end
  end
end
