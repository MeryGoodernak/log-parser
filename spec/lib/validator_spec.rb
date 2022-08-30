# frozen_string_literal: true

require 'validator'

RSpec.describe Validator do
  subject { described_class.new(line: params) }

  context 'valid line' do
    let(:params) { '/help_page/1 646.865.545.408' }
    it 'returns true' do
      expect(subject.valid?).to be true
    end
  end

  context 'invalid line' do
    context 'some random text without url and ip' do
      let(:params) { 'some random text without url and ip' }
      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end

    context 'an empty string' do
      let(:params) { '' }
      it 'returns false' do
        expect(subject.valid?).to be false
      end
    end
  end
end
