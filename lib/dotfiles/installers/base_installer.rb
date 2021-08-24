# frozen_string_literal: true

module Dotfiles
  module Installers
    class BaseInstaller
      def initialize(application)
        @app = application
      end

      def key
        self.class.to_s.split('::').last.downcase
      end

      def install
        if !app.only_present? && app.yes_no_quit?(confirmation_message)
          perform_installation
        end

        if app.only?(key)
          perform_installation
        end
      end

      private

      def confirmation_message
        "Do you want to install \"#{name}\"?"
      end

      def name
        key.to_s
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

      def yes_no_unless?(question, &block)
        if block.call
          return true
        end

        yes_no?(question)
      end

      def dotfile(file)
        app.dotfile(file)
      end

      attr_reader :app
    end
  end
end
