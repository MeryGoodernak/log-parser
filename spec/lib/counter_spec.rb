# frozen_string_literal: true

require 'counter'
require 'data_keeper'

RSpec.describe Counter do
  subject { described_class.new(data_keeper: data_keeper) }
  let(:data_keeper) { DataKeeper.new }

  describe '#total' do
    context 'when storage is empty' do
      it 'returns an empty array' do
        expect(subject.total).to eq([])
      end
    end

    context 'when storage is not empty' do
      before do
        data_keeper.add(line: '/about 336.284.013.698')
        data_keeper.add(line: '/about 336.284.013.698')
        data_keeper.add(line: '/help_page/1 235.313.352.950')
        data_keeper.add(line: '/about 235.313.352.951')
        data_keeper.add(line: '/about 235.313.352.951')
      end
      it 'returns the total number of views for each page ordered from most pages views to less pages views' do
        expect(subject.total).to eq([['/about', 4], ['/help_page/1', 1]])
      end
    end
  end

  describe '#unique' do
    context 'when storage is empty' do
      it 'returns an empty array' do
        expect(subject.unique).to eq([])
      end
    end

    context 'when storage is not empty' do
      before do
        data_keeper.add(line: '/about 336.284.013.698')
        data_keeper.add(line: '/about 336.284.013.698')
        data_keeper.add(line: '/help_page/1 235.313.352.950')
        data_keeper.add(line: '/about 235.313.352.951')
        data_keeper.add(line: '/about 235.313.352.951')
      end
      it 'returns the unique number of views for each page ordered from most pages views to less pages views' do
        expect(subject.unique).to eq([['/about', 2], ['/help_page/1', 1]])
      end
    end
  end
end
