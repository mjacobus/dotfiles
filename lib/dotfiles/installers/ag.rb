# frozen_string_literal: true

module Dotfiles
  module Installers
    class Ag < BaseInstaller
      def name
        'ag configuration'
      end

      private

      def perform_installation
        file = app.destination_for('.agignore')
        app.link(app.dotfile('agignore'), file)
      end
    end
  end
end
