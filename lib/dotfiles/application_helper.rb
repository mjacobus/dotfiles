# frozen_string_literal: true

require 'colorized_string'

module Dotfiles
  class ApplicationHelper
    attr_reader :home

    def initialize(argv, output = $stdout, command_runner: CommandRunner.new)
      @command_runner = command_runner
      @argv = argv.dup
      @output = output
      @time = Time.now
      @home = ENV['HOME']
    end

    def run(command)
      output(command.to_s, color: :yellow)
      stdout = @command_runner.run(command)
      unless stdout.empty?
        output(stdout)
      end
    rescue CommandError => exception
      output(exception.command_result.error, color: :red)
      exit(exception.command_result.code)
    end

    def ask(question)
      output(question, color: :green)
      gets.chomp
    end

    def timestamp
      Time.new.strftime('%Y%m%d%H%M%s')
    end

    def symlink(source, target)
      if file_exist?(target)
        backup(target)
      end

      run("ln -sf #{source} #{target}")
    end

    def output(string, color: nil)
      if color
        string = ColorizedString.new(string).send(color)
      end

      @output.puts(string)
    end

    def file_exist?(file)
      File.exist?(file)
    end

    def backup(file)
      output("File exists: #{file}. It will be moved to #{backup_destination}.")
      run("mkdir -p #{backup_destination}")
      run("mv #{file} #{backup_destination}/")
    end

    def yes_no_quit?(question)
      answer = ask("#{question} Y[es]/N[no]/Q[quit]").downcase

      if answer == 'q'
        exit(0)
      end

      answer == 'y'
    end

    def yes_no?(question)
      ask("#{question} (Y/N)").downcase == 'y'
    end

    def destination_for(path = nil)
      [home, path].join('/')
    end

    def dotfile(file)
      "#{home}/.dotfiles/#{file}"
    end

    def github_clone(source, destination)
      run("git clone https://github.com/#{source}.git #{destination}")
    end

    private

    def backup_destination
      "#{home}/.dotfiles-backup/#{timestamp}"
    end
  end
end
