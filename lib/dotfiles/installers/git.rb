# frozen_string_literal: true

module Dotfiles
  module Installers
    class Git < BaseInstaller
      def name
        'git configuration'
      end

      private

      def perform_installation
        file = destination_for('.gitconfig')
        symlink(dotfile('git/gitconfig'), file)

        email = ask('What is your email?')

        if email == 'marcelo.jacobus@gmail.com'
          file = destination_for('.gitconfig.local')
          symlink(dotfile('git/gitconfig.local'), file)
        end

        file = destination_for('.gitignore_global')
        symlink(dotfile('git/gitignore_global'), file)
      end
    end
  end
end
