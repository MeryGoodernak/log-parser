# frozen_string_literal: true

require 'data_keeper'

RSpec.describe DataKeeper do
  subject { described_class.new }

  describe '#add' do
    context 'when storage is empty' do
      let(:params) { '/about 336.284.013.698' }
      before { subject.add(line: params) }

      it 'adds a line of log to the storage' do
        expect(subject.storage.size).to eq(1)
      end

      it 'adds url as key for the storage which is a hash' do
        expect(subject.storage.keys).to include('/about')
      end

      it 'adds ip as value for the storage which is a hash' do
        expect(subject.storage['/about']).to include('336.284.013.698')
      end
    end

    context 'when the key is new in the storage' do
      let(:params) { '/help_page/1 235.313.352.950' }
      before { subject.add(line: '/about 336.284.013.698') }
      it 'increases the size of storage by one' do
        subject.add(line: params)
        expect(subject.storage.size).to eq(2)
      end
    end

    context 'when the key already exists in the storage' do
      let(:params) { '/about 336.284.013.698' }
      before { subject.add(line: '/about 336.284.013.698') }
      it 'increases the size of ip array for the url key by one' do
        subject.add(line: params)
        expect(subject.storage['/about'].size).to eq(2)
      end
    end
  end
end
