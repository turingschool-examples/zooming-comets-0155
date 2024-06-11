class Item
  attr_reader :name, :bids

  def initialize(name)
    # require 'pry' binding.pry
    @name = name
    @bids = {}
  end

  def add_bid(attendee, ammout)
    @bids[attendee] = amount
  end

  def curent_high_bid
    @bids.values.max
  end
end
