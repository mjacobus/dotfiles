module Dev
  module Cli
    module Command
      class Base
        def with_options(options)
          @options = options
          self
        end

        def with_application(application)
          @application = application
          self
        end

        def options
          raise "No options given" unless @options
          @options
        end

        def application
          raise "No application given" unless @application
          @application
        end

        def name
          raise "you must provide a command name"
        end

        def description
          raise "you must provide a command description"
        end

        def options_taken
          []
        end

        def run(*args)
          raise "you must provide a command method"
        end
      end
    end
  end
end
