class Item
attr_reader :bids, :name, :unpopular 

  def initialize(name)
    @bids = []
    @name = name
    @unpopular = unpopular?
  end

  def add_bid(attendee, bid_amount)
    bid = {attendee => bid_amount} 
    @bids << bid
  end

  def current_high_bid
    bids_array = @bids.max_by{|attendee, bid_amount| bid_amount}
      bids_array.first
    # require 'pry'; binding.pry
  end

  def unpopular?
    return true if @bids = []
    return false if @bids.!empty?
  end
end
