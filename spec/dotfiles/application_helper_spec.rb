# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Dotfiles::ApplicationHelper do
  subject(:app) { described_class.new(argv) }

  let(:argv) { ['--foo=bar', '--x=y'] }

  describe '#options' do
    it 'returns a hash version of the argv' do
      expect(app.options).to eq(
        'foo' => 'bar',
        'x' => 'y'
      )
    end
  end

  describe '#only?' do
    context 'when argv does not include the option' do
      it 'returns false when option is not passed' do
        expect(app.only?('asdf')).to be false
      end
    end

    context 'when includes the option but the installer is not there' do
      before do
        argv.push('--only=foo')
      end

      it 'returns false when option is not passed' do
        expect(app.only?('asdf')).to be false
      end
    end

    context 'when includes the installer' do
      before do
        argv.push('--only=asdf,foo,bar')
      end

      it 'returns false when option is not passed' do
        expect(app.only?('asdf')).to be true
      end
    end
  end
end
