# frozen_string_literal: true

class Counter
  def initialize(data_keeper:)
    @data_keeper = data_keeper
  end

  def total
    result = data_keeper.storage.map do |url, ips|
      [url, ips.length]
    end
    sort(views: result)
  end

  def unique
    result = data_keeper.storage.map do |url, ips|
      [url, ips.uniq.length]
    end
    sort(views: result)
  end

  private

  attr_reader :data_keeper

  def sort(views:)
    views.sort_by { |_, value| -value }
  end
end
