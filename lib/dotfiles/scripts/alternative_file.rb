# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
require_relative './alternative_file/file'

module Dotfiles
  module Scripts
    class AlternativeFile
      def execute(argv)
        file = argv.first

        if file.match?(/.*_(test|spec).rb$/)
          return find_alternative_for_ruby_test_file(File.new(file))
        end

        if file.match?(/.*\.rb$/)
          find_ruby_test_file_for(file)
        end
      end

      private

      def exist?(file)
        ::File.exist?(file.to_s)
      end

      def find_ruby_test_file_for(file, prefix: File.new(''))
        if file.match?(/^packages/)
          return find_packaged_test_file_for(file)
        end

        minitest_folder = prefix.join('test')
        rspec_folder = "#{prefix}spec"

        minitest = "#{minitest_folder}/".gsub('//', '/')
        minitest += file.sub(/(lib|app)/, '').sub('.rb', '_test.rb')
        minitest = minitest.gsub('//', '/')

        rspec = "#{rspec_folder}/".gsub('//', '/')
        rspec += file.sub(/(lib|app)/, '').sub('.rb', '_spec.rb')
        rspec = rspec.gsub('//', '/')

        if exist?(minitest_folder) && exist?(rspec_folder)
          [rspec, minitest].each do |candidate|
            if exist?(candidate)
              return candidate
            end
          end

          return rspec
        end

        if exist?(minitest_folder)
          return minitest
        end

        rspec
      end

      def find_packaged_test_file_for(file)
        parts = file.split('/')
        rejected_parts = %w[private public]

        package = File.join([parts[0..1]])
        file = [parts[2..]]
          .flatten
          .reject { |p| rejected_parts.include?(p) }
          .join('/')

        find_ruby_test_file_for(file, prefix: package)
      end

      def find_alternative_for_ruby_test_file(file, prefix: File.new(''))
        if file.match?(/^packages/)
          return find_packaged_file_for_test(file)
        end

        file = file
          .sub(/_(test|spec).rb$/, '.rb')
          .sub(%r{^(test|tests|spec|specs)/}, '')

        possible_folders = ['lib', 'app/models', 'app', 'private', 'public']
        possible_folders.each do |folder|
          candidate = prefix.join(folder).join(file)
          if exist?(candidate)
            return candidate
          end
        end

        file.prefix_with('lib')
      end

      def find_packaged_file_for_test(file)
        parts = file.split('/')
        package = File.join([parts[0..1]])
        file = File.join([parts[2..]])
        prefix = File.new(package)

        find_alternative_for_ruby_test_file(file, prefix: prefix)
      end
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
