# frozen_string_literal: true

require 'spec_helper'
require 'dotfiles/scripts/alternative_file'

RSpec.describe Dotfiles::Scripts::AlternativeFile do
  let(:script) { described_class.new }

  it 'finds the spec file when it exists' do
    file = 'lib/dotfiles/scripts/alternative_file.rb'

    found = script.execute([file])

    expect(found).to eq('spec/dotfiles/scripts/alternative_file_spec.rb')
  end

  it 'finds the test file when it exists' do
    mock_exist('test')
    file = 'lib/dotfiles/scripts/alternative_file.rb'

    found = script.execute([file])

    expect(found).to eq('test/dotfiles/scripts/alternative_file_test.rb')
  end

  it 'finds the alternative file for a spec file in gem' do
    file = 'spec/dotfiles/scripts/alternative_file_spec.rb'

    found = script.execute([file])

    expect(found).to eq('lib/dotfiles/scripts/alternative_file.rb')
  end

  it 'finds the alternative file for a minitest file in gem' do
    file = 'test/dotfiles/scripts/alternative_file_test.rb'

    found = script.execute([file])

    expect(found).to eq('lib/dotfiles/scripts/alternative_file.rb')
  end

  it 'finds the alternative file for a minitest file when no alternative file exists' do
    mock_exist(:all, false)
    file = 'test/dotfiles/scripts/alternative_file_test.rb'

    found = script.execute([file])

    expect(found).to eq('lib/dotfiles/scripts/alternative_file.rb')
  end

  it 'finds spec for rails model' do
    mock_exist(:all, false)
    mock_exist('spec', true)

    file = 'app/models/user.rb'

    found = script.execute([file])

    expect(found).to eq('spec/models/user_spec.rb')
  end

  def mock_exist(file, exist = true)
    if file == :all
      allow(File).to receive(:exist?).and_return(exist)
      return
    end
    allow(File).to receive(:exist?).with(file).and_return(exist)
  end
end