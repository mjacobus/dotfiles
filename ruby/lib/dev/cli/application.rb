require "thor"
require 'open3'

module Dev
  module Cli
    class ExtendedThor < Thor
      no_commands do
        def self.append_command(command)
          desc *command.description
          command.options_taken.each do |option|
            self.option *option
          end

          define_method(command.name) do |*args|
            command.with_options(options).run(*args)
          end
        end
      end
    end
  end
end

module Dev
  module Cli
    class Application
      def initialize(cli_builder = ExtendedThor, commands = [])
        @cli = cli_builder
        append_commands(commands)
      end

      def append_commands(commands)
        commands.each { |command| append_command(command) }
      end

      def append_command(command)
        cli.append_command(command.with_application(self))
      end

      def start(args)
        cli.start(args)
      end

      def shell_exec(*command)
        system(*command.join(' ').to_s)
        $?.exitstatus
      end

      def shell_exec!(*command)
        exit_status = shell_exec(*command)
        exit(exit_status) unless exit_status == 0
      end

      # block: |stdin, stdout, stderr, wait_thr|
      #   exit code: wait_thr.value
      def execute(command, &block)
        Open3.popen3(command, &block)
      end

      def capture_stdout(command)
        lines = []
        execute(command) do |stdin, stdout, stderr, wait_thr|
          while line = stdout.gets
            lines << line
          end
        end
        lines
      end

      def fail(message: nil, code: 1)
        puts message if message
        exit(code)
      end

      private

      attr_reader :cli
    end
  end
end
