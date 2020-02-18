# frozen_string_literal: true

module Dotfiles
  module Installers
    class BaseInstaller
      def initialize(application)
        @app = application
      end

      def install
        if app.yes_no?(confirmation_message)
          perform_installation
        end
      end

      private

      def confirmation_message
        "Sure you want to install \"#{name}\"?"
      end

      def name
        self.class.to_s.split('::').last
      end

      def perform_installation
        raise "Not implemented: #{self.class}"
      end

      def symlink(source, destination)
        app.symlink(source, destination)
      end

      def destination_for(filename)
        app.destination_for(filename)
      end

      def ask(question)
        app.ask(question)
      end

      def yes_no?(question)
        app.yes_no?(question)
      end

      def dotfile(file)
        app.dotfile(file)
      end

      attr_reader :app
    end
  end
end
