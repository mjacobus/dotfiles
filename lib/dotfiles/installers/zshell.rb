# frozen_string_literal: true

module Dotfiles
  module Installers
    class Zshell < BaseInstaller
      def name
        'zshell configuration'
      end

      private

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Layout/LineLength
      def perform_installation
        symlink(dotfile('profile.d'), destination_for('.profile.d'))

        unless app.file_exist?("#{app.home}/.oh-my-zsh")
          app.run('sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
        end

        unless app.file_exist?("#{app.home}/.config/base16-shell")
          app.run("mkdir -p #{app.home}/.config/base16-shell")
          app.github_clone('chriskempson/base16-shell', "#{app.home}/.config/base16-shell")
        end

        # Do we really want to load the app like this?
        # app.run("source ~/.profile.d/setup.sh >> #{app.home}/.zshell")

        symlink(dotfile('shell_setup.conf'), destination_for('.zshrc'))
      end
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Layout/LineLength
    end
  end
end
