require 'open3'

module Dev
  module Cli
    module Command
      class GitCheckoutBranch < Base
        def name
          'git_checkout_branch'
        end

        def description
          ["git_checkout_branch", "checks matching branch"]
        end

        def options_taken
          [
            [:branch, type: :string]
          ]
        end

        def run
          branch = options[:branch].gsub(' ', '-')
          command = "git branch | grep -i #{branch}"
          branches = []

          branches = application.capture_stdout(command).map do |line|
            line.gsub(/\*?\s+/, ' ').split(' ')[0]
          end

          checked = false

          if branches.include?(branch)
            command = "git checkout #{branches.first}"
            application.shell_exec!(command)
            checked = true
          end

          if branches.length > 1
            if checked
              puts "WARNING:"
            end

            puts "Too many branches found:"
            puts branches.map{ |branch| "\t#{branch}" }.join("\n")

            unless checked
              application.fail
            end
          end

          if branches.length == 0
            application.fail(message: "No matches found")
          end

          command = "git checkout #{branches.first}"
          application.shell_exec!(command)
        end
      end
    end
  end
end
