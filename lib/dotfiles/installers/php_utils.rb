# frozen_string_literal: true

module Dotfiles
  module Installers
    class PhpUtils < BaseInstaller
      def name
        'php_utils configuration'
      end

      private

      def perform_installation
        composer_folder = destination_for('.composer')
        symlink(dotfile('composer'), composer_folder)
        app.run("cd #{composer_folder} && composer install")
        app.run('curl -Ss http://vim-php.com/phpctags/install/phpctags.phar > ~/.dotfiles/bin/phpctags.phar')
      end
    end
  end
end
