# frozen_string_literal: true

module Dotfiles
  module Installers
    class Irb < BaseInstaller
      def name
        'irb configuration'
      end

      private

      def perform_installation
        file = destination_for('.irbrc')
        symlink(dotfile('ruby/irbrc'), file)
      end
    end
  end
end
