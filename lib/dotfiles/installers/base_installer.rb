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

      attr_reader :app
    end
  end
end
