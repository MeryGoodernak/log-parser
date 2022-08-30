# frozen_string_literal: true

class Validator
  def initialize(line:)
    @line = line
    @regex = %r/\A(\/\w+)*\s(\d{3}\S){3}\d{3}\z/
  end

  def valid?
    @line.match?(@regex)
  end
end
