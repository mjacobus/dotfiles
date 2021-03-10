# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
require 'pathname'
require_relative './alternative_file/file'

module Dotfiles
  module Scripts
    class AlternativeFile
      def execute(argv)
        file = File.new(argv.first)

        if file.match?(/.*_(test|spec).rb$/)
          return find_alternative_for_ruby_test_file(file)
        end

        if file.match?(/.*\.rb$/)
          find_ruby_test_file_for(file)
        end
      end

      private

      def find_ruby_test_file_for(file, prefix: File.new)
        if file.match?(/^packages/)
          return find_packaged_test_file_for(file)
        end

        if file.start_with?('public/') || file.start_with?('private/')
          file = file.without_prefix('public/').without_prefix('private/')
        end

        minitest_folder = prefix.join('test')
        minitest = minitest_folder.join(file).sub(/(lib|app)/, '').sub('.rb', '_test.rb')

        rspec_folder = prefix.join('spec')
        rspec = rspec_folder.join(file).sub(/(lib|app)/, '').sub('.rb', '_spec.rb')

        if minitest_folder.exist? && rspec_folder.exist?
          return best_candidate([rspec, minitest])
        end

        if minitest_folder.exist?
          return minitest
        end

        rspec
      end

      def find_packaged_test_file_for(file)
        parts = file.split
        rejected_parts = %w[private public]

        package = File.join([parts[0..1]])
        file = [parts[2..]]
          .flatten
          .reject { |p| rejected_parts.include?(p) }
          .join('/')

        find_ruby_test_file_for(file, prefix: package)
      end

      def find_alternative_for_ruby_test_file(file, prefix: File.new)
        if file.match?(/^packages/)
          return find_packaged_file_for_test(file)
        end

        file = file
          .sub(/_(test|spec).rb$/, '.rb')
          .sub(%r{^(test|tests|spec|specs)/}, '')

        possible_folders = ['lib', 'app/models', 'app', 'private', 'public']
        candidates = possible_folders.map { |folder| prefix.join(folder).join(file) }
        best_candidate(candidates)
      end

      def find_packaged_file_for_test(file)
        parts = file.split
        package = File.join([parts[0..1]])
        file = File.join([parts[2..]])
        prefix = File.new(package)

        find_alternative_for_ruby_test_file(file, prefix: prefix)
      end

      def best_candidate(candidates)
        candidates.find(&:exist?) || candidates.first
      end
    end
  end
end
# rubocop:enable Metrics/MethodLength
