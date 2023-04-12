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

          def match?(pattern)
            Regexp.new(pattern).match?(@name)
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
          command = "git branch"
          remote_command = "git branch -a"

          branches = application.capture_stdout(command).map do |line|
            LocalBranch.new(output_line_to_branch_name(line))
          end

          if branches.empty?
            branches = application.capture_stdout(remote_command).map do |line|
              RemoteBranch.new(output_line_to_branch_name(line))
            end
          end

          checked_out = nil

          branches = branches.select { |b| b.match?(searched_branch) }

          branches.each do |branch|
            if searched_branch == branch.name
              checked_out = perform_checkout(branch)
              break
            end
          end

          if branches.length > 1
            warn_too_many_branches(branches)
          end

          if checked_out
            return
          end

          if branches.any?
            branch = branches.sort_by{|b| b.name.length }.first
            return perform_checkout(branch)
          end

          application.fail(message: "No matches found")
        end

        private

        def output_line_to_branch_name(line)
          line.gsub(/\*?\s+/, ' ').split(' ')[0]
        end

        def perform_checkout(branch)
          puts ""
          puts "CHECKING OUT #{branch.name}:"
          puts ""
          puts "\t~> #{branch.checkout_command}\n\n"
          puts ""
          application.shell_exec!(branch.checkout_command)
          branch
        end

        def warn_too_many_branches(branches)
          puts "WARNING: Too many branches found:"
          puts ""
          puts branches.map(&:name).map{|n| "\t#{n}" }.join("\n")
          puts ""
        end
      end
    end
  end
end
