# frozen_string_literal: true

module Dotfiles
  module Installers
    class Inputrc < BaseInstaller
      def name
        '.inputrc configuration'
      end

      private

      def perform_installation
        symlink(dotfile('.inputrc'), destination_for('.inputrc'))
      end
    end
  end
end

