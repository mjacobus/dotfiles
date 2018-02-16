module Dev
  module Cli
    module Command
      class GitCheckoutBranch < Base
        class LocalBranch
          attr_reader :name, :checkout_command

          def initialize(branch_name)
            @name = branch_name
            @checkout_command = "git checkout #{name}"
          end
        end

        class RemoteBranch < LocalBranch
          def initialize(branch_name)
            branch_name = branch_name.sub('remotes/', '').sub('origin/', '')
            super(branch_name)
            @checkout_command = "git checkout -b #{branch_name} origin/#{branch_name}"
          end
        end

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
          searched_branch = options[:branch].gsub(' ', '-')
          command = "git branch | grep -i #{searched_branch}"
          remote_command = "git branch -a | grep -i #{searched_branch}"

          branches = application.capture_stdout(command).map do |line|
            matched_branch = line.gsub(/\*?\s+/, ' ').split(' ')[0]
            LocalBranch.new(matched_branch)
          end

          if branches.empty?
            branches = application.capture_stdout(remote_command).map do |line|
              matched_branch = line.gsub(/\*?\s+/, ' ').split(' ')[0]
              RemoteBranch.new(matched_branch)
            end
          end

          checked_out = nil

          branches.each do |branch|
            if searched_branch == branch.name
              checked_out = perform_checkout(branch)
              break
            end
          end

          if branches.length > 1
            puts "WARNING: Too many branches found:"
            branches.each { |branch| puts "\t#{branch.name}" }
          end

          if branches.any?
            checked_out ||= perform_checkout(branches.sort_by{|b| b.name.length }.first)
          end

          unless checked_out
            application.fail(message: "No matches found")
          end
        end

        def perform_checkout(branch)
          puts ""
          puts "CHECKING OUT : #{branch.name}"
          puts ""
          puts "~> #{branch.checkout_command}\n\n"
          puts ""
          application.shell_exec!(branch.checkout_command)
          branch
        end
      end
    end
  end
end
