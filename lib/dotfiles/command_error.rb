# frozen_string_literal: true

module Dotfiles
  class CommandError < Error
    attr_reader :command_result

    def initialize(command_result)
      @command_result = command_result
    end

    def message
      "Command '#{@command_result.command}' exited with code #{@command_result.code}"
    end
  end
end
