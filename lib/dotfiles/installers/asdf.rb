# frozen_string_literal: true

module Dotfiles
  module Installers
    class Asdf < BaseInstaller
      def name
        'asdf configuration'
      end

      private

      def perform_installation
        ensure_prerequisites
        install_config_files
        clone_asdf
        add_plugin('ruby')
        add_plugin('php', 'https://github.com/asdf-community/asdf-php.git')
        install_nodejs
      end

      def ensure_prerequisites
        profile_config = destination_for('.profile.d')
        unless app.file_exist?(profile_config)
          throw Dotfiles::Error.new("Missing #{profile_config}. Please install zshell first")
        end
      end

      def install_config_files
        symlink(dotfile('git/asdfrc'), destination_for('.asdfrc'))
        symlink(dotfile('.tools-versions'), destination_for('.tools-versions'))
      end

      def clone_asdf
        unless app.file_exist?(destination_for('.asdf'))
          app.github_clone('asdf-vm/asdf', "#{app.home}/.asdf")
          app.run('cd ~/.asdf && git checkout "$(git describe --abbrev=0 --tags)"')
        end
      end

      def install_nodejs
        add_plugin('nodejs')
        app.output('The next command may take a while', color: :red)
        app.run("bash #{destination_for('.asdf')}/plugins/nodejs/bin/import-release-team-keyring")
      end

      def add_plugin(name, source = nil)
        script = destination_for('.asdf/bin/asdf')
        source ||= "https://github.com/asdf-vm/asdf-#{name}.git"
        app.run("#{script} plugin-add #{name} #{source}")
      end
    end
  end
end
