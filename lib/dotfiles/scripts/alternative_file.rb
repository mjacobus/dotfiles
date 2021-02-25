# frozen_string_literal: true

module Dotfiles
  module Scripts
    class AlternativeFile
      def execute(argv)
        file = argv.first

        if file.match?(/.*_(test|spec).rb$/)
          return find_alternative_for_ruby_test_file(file)
        end

        if file.match?(/.*\.rb$/)
          find_ruby_test_file_for(file)
        end
      end

      private

      # rubocop:disable Metrics/MethodLength
      def find_ruby_test_file_for(file)
        rspec = file.sub(/(lib|app)/, 'spec').sub('.rb', '_spec.rb')
        minitest = file.sub(/(lib|app)/, 'test').sub('.rb', '_test.rb')

        if File.exist?('test') && File.exist?('spec')
          [rspec, minitest].each do |candidate|
            if File.exist?(candidate)
              return candidate
            end
          end

          return rspec
        end

        if File.exist?('test')
          return minitest
        end

        rspec
      end
      # rubocop:enable Metrics/MethodLength

      def find_alternative_for_ruby_test_file(file)
        file = file.sub(/_(test|spec).rb$/, '.rb')
        file = file.sub(%r{^(test|tests|spec|specs)/}, '')

        possible_folders = ['lib', 'app/models', 'app']
        possible_folders.each do |folder|
          candidate = "#{folder}/#{file}"
          if File.exist?(candidate)
            return candidate
          end
        end

        "lib/#{file}"
      end
    end
  end
end
