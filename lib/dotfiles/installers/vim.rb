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
        symlink(dotfile('vim/nvimrc'), destination_for('.nvimrc'))
        symlink(dotfile('vim'), destination_for('.nvim'))
        symlink(dotfile('vim/ideavimrc'), destination_for('.ideavimrc'))
        symlink(dotfile('vim/gvimrc'), destination_for('.gvimrc'))

        app.run("mkdir -p #{app.home}/.config")
        symlink(destination_for('.nvim'), destination_for('.config/nvim'))
        app.run('vim +PlugInstall +quitall')
      end
      # rubocop:enable Metrics/AbcSize
    end
  end
end
