#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/data_keeper'
require_relative 'lib/reader'
require_relative 'lib/counter'
require_relative 'lib/printer'

file_path = ARGV[0]

data_keeper = DataKeeper.new
reader = Reader.new(file_path: file_path, data_keeper: data_keeper)

begin
  reader.validate
rescue NoFilePath => e
  puts "#{e.class}: Please enter the path of log file"
  exit
rescue FileNotExistError => e
  puts "#{e.class}: There is no such file"
  exit
rescue EmptyFileError => e
  puts "#{e.class}: The file is empty"
  exit
end

reader.read

counter = Counter.new(data_keeper: data_keeper)
printer = Printer.new(counter: counter)

printer.print_views(report_type: 'total')
printer.print_views(report_type: 'unique')
