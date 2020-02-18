# frozen_string_literal: true

require 'English'
require 'open3'

module Dotfiles
  class CommandRunner
    def run(command)
      result, error, status = Open3.capture3(command.to_s)
      result = CommandResult.new(command, status, result, error)

      unless result.code.zero?
        raise CommandError, result
      end

      result.output
    end

    private

    def execute_shell(command)
      `#{command}`
    end
  end
end
