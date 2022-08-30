# frozen_string_literal: true

require 'printer'
require 'counter'
require 'data_keeper'

RSpec.describe Printer do
  subject { described_class.new(counter: counter) }
  let(:counter) { Counter.new(data_keeper: data_keeper) }
  let(:data_keeper) { DataKeeper.new }

  before do
    data_keeper.add(line: '/about 336.284.013.698')
    data_keeper.add(line: '/about 336.284.013.698')
    data_keeper.add(line: '/help_page/1 235.313.352.950')
    data_keeper.add(line: '/about 235.313.352.951')
    data_keeper.add(line: '/about 235.313.352.951')
  end

  describe '#print_views' do
    let(:expected_output) do
      <<~OUTPUT
        Unique Views:
        /about has 2 unique views
        /help_page/1 has 1 unique views

      OUTPUT
    end

    it 'prints the number of unique views for each page' do
      expect do
        subject.print_views(report_type: 'unique')
      end.to output(expected_output).to_stdout
    end
  end
end
