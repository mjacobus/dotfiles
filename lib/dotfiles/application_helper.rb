# frozen_string_literal: true

require 'colorized_string'

module Dotfiles
  class ApplicationHelper
    attr_reader :home

    def initialize(argv, output = $stdout, time = Time.now)
      @command_runner = CommandRunner.new
      @argv = argv.dup
      @output = output
      @time = time
      @home = ENV['HOME']
    end

    def run(command)
      output(command.to_s, color: :yellow)
      @command_runner.run(command)
    end

    def ask(question)
      output(question, color: :green)
      gets.chomp
    end

    def timestamp
      Time.new.strftime('%Y%m%d%H%M')
    end

    def link(source, target)
      if file_exist?(target)
        offer_backup_for_file(target)
      end

      run("ln -s #{source} #{target}")
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
      run("mkdir -p #{backup_destination}")
      run("mv #{file} #{backup_destination}/")
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

    private

    def backup_destination
      "#{home}/.dotfiles-backup/#{timestamp}"
    end

    def offer_backup_for_file(file)
      output("File exists: #{file}.")
      if yes_no?('Do you want to backup?')
        backup(file)
      end
    end
  end
end
