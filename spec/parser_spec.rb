# frozen_string_literal: true

require 'parser'

RSpec.describe 'parser' do
  context 'when there is correct file' do
    subject { system './parser.rb spec/fixtures/webserver.log' }
    let(:expected_output) do
      <<~OUTPUT
        Total Views:
        /help_page/1 has 2 total views
        /about has 1 total views
        /home has 1 total views

        Unique Views:
        /help_page/1 has 2 unique views
        /about has 1 unique views
        /home has 1 unique views

      OUTPUT
    end

    it 'prints the correct output' do
      expect { subject }.to output(expected_output).to_stdout_from_any_process
    end
  end

  context 'when the file does not exist' do
    subject { system './parser.rb spec/fixtures/nonexistent.log' }
    let(:expected_output) { "FileNotExistError: There is no such file\n" }
    it 'prints FileNotExistError: There is no such file' do
      expect { subject }.to output(expected_output).to_stdout_from_any_process
    end
  end

  context 'when the file is empty' do
    subject { system './parser.rb spec/fixtures/empty_file.log' }
    let(:expected_output) { "EmptyFileError: The file is empty\n" }
    it 'prints EmptyFileError: The file is empty' do
      expect { subject }.to output(expected_output).to_stdout_from_any_process
    end
  end

  context 'when file path is nil' do
    subject { system './parser.rb' }
    let(:expected_output) { "NoFilePath: Please enter the path of log file\n" }
    it 'prints NoFilePath: Please enter the path of log file' do
      expect { subject }.to output(expected_output).to_stdout_from_any_process
    end
  end
end
