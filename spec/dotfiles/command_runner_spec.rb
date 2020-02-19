# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Dotfiles::CommandRunner do
  subject(:runner) { described_class.new }

  it 'returns a status zero when command runs' do
    content = runner.run('echo "foo\nbar"')

    expect(content).to eq(['foo', 'bar', ''].join("\n"))
  end

  it 'raises when there is an error' do
    begin
      runner.run('ls xxxx')
      raise 'it should have failed'
    rescue Dotfiles::CommandError => exception
      expect(exception.command_result.code).to eq(512)
    end
  end
end
