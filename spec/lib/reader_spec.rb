# frozen_string_literal: true

require 'reader'
require 'data_keeper'

RSpec.describe Reader do
  subject { described_class.new(file_path: file_path, data_keeper: data_keeper) }
  let(:data_keeper) { instance_double(DataKeeper) }

  describe '#read' do
    let(:file_path) { 'spec/fixtures/log_sample.log' }
    context 'when line is valid' do
      it 'adds line to storage' do
        expect(data_keeper).to receive(:add).with(line: '/about 061.945.150.735')
        subject.read
      end
    end

    context 'when line is not valid' do
      it 'does not add line to storage' do
        expect(data_keeper).not_to receive(:add).with(line: '# this is a comment inside a log file')
      end
    end
  end

  describe '#validate' do
    context 'when file does not exist' do
      let(:file_path) { 'spec/fixtures/nonexistent.log' }
      it 'raises a FileNotExistError error' do
        expect { subject.validate }.to raise_error(FileNotExistError)
      end
    end

    context 'when file is empty' do
      let(:file_path) { 'spec/fixtures/empty_file.log' }
      it 'raises a EmptyFileError error' do
        expect { subject.validate }.to raise_error(EmptyFileError)
      end
    end

    context 'when file path is nil' do
      let(:file_path) { nil }
      it 'raises a NoFilePath error' do
        expect { subject.validate }.to raise_error(NoFilePath)
      end
    end
  end
end
