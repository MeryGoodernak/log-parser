# frozen_string_literal: true

require_relative 'validator'
require_relative 'error'

class Reader
  def initialize(file_path:, data_keeper:)
    @file_path = file_path
    @data_keeper = data_keeper
  end

  def validate
    raise NoFilePath if file_path.nil?

    raise FileNotExistError unless File.exist?(file_path)

    raise EmptyFileError if File.empty?(file_path)
  end

  def read
    File.open(file_path, 'r').each do |line|
      line.chomp!
      validator = Validator.new(line: line)
      data_keeper.add(line: line) if validator.valid?
    end
  end

  private

  attr_reader :file_path, :data_keeper
end
