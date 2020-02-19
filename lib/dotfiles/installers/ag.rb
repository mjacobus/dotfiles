# frozen_string_literal: true

module Dotfiles
  module Installers
    class Ag < BaseInstaller
      def name
        'ag configuration'
      end

      private

      def perform_installation
        file = destination_for('.agignore')
        symlink(dotfile('agignore'), file)
      end
    end
  end
end
