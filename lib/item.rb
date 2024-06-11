class Item
  attr_reader :name, :bids

  def initialize(name)
    # require 'pry' binding.pry
    @name = name
    @bids = {}
  end

  def add_bid(attendee, amount)
    @bids[attendee] = amount
  end

  def current_high_bid
    @bids.values.max
  end
end
