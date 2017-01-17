require "thor"

module Dev
  module Cli
    class Application < Thor
      no_commands do
        def self.add_custom_commands(commands)
          commands.each do |command|
            add_custom_command(command)
          end

          self
        end

        def self.add_custom_command(command)
          desc *command.description
          command.options_taken.each do |option|
            self.option *option
          end

          define_method(command.name) do |*args|
            command.with_options(options).with_application(self).run(*args)
          end

          self
        end

        def from_shell(*command)
          system(*command.join(' ').to_s)
          $?.exitstatus
        end

        def from_shell!(*command)
          exit_status = from_shell(*command)

          unless exit_status == 0
            exit(exit_status)
          end
        end
      end
    end
  end
end
