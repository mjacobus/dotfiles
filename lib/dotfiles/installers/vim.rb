# frozen_string_literal: true

module Dotfiles
  module Installers
    class Vim < BaseInstaller
      def name
        'vim configuration'
      end

      private

      # rubocop:disable Metrics/AbcSize
      def perform_installation
        symlink(dotfile('vim'), destination_for('.vim'))
        symlink(dotfile('vim/vimrc'), destination_for('.vimrc'))
        symlink(dotfile('vim/ideavimrc'), destination_for('.ideavimrc'))
        symlink(dotfile('vim/gvimrc'), destination_for('.gvimrc'))

        app.run("mkdir -p #{app.home}/.config")
        app.run('vim +PlugInstall +quitall')

        unless app.options['vim-skip-plug-install']
          app.run('vim +PlugInstall +quitall')
        end
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
