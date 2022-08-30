# frozen_string_literal: true

class Printer
  def initialize(counter:)
    @counter = counter
  end

  def print_views(report_type:)
    puts "#{report_type.capitalize} Views:"
    puts views_format(report_type: report_type)
    puts
  end

  private

  attr_reader :counter

  def views_format(report_type:)
    counter.send(report_type).map do |result|
      "#{result[0]} has #{result[1]} #{report_type} views"
    end.join("\n")
  end
end
