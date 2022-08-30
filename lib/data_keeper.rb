# frozen_string_literal: true

class DataKeeper
  attr_reader :storage

  def initialize
    @storage = {}
  end

  def add(line:)
    url, ip = line.split
    storage[url] ||= []
    storage[url] << ip
  end

  private

  attr_writer :storage
end
