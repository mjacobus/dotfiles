# frozen_string_literal: true

module Dotfiles
  class CommandResult < RuntimeError
    attr_reader :command
    attr_reader :code
    attr_reader :output
    attr_reader :error

    def initialize(command, status, output, error)
      @command = command.to_s
      @code = status.to_i
      @output = output
      @error = error
    end
  end
end
