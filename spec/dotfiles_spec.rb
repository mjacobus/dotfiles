# frozen_string_literal: true

RSpec.describe Dotfiles do
  it 'has a version number' do
    expect(Dotfiles::VERSION).not_to be nil
  end
end
