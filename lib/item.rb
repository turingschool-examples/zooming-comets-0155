class Item 
  attr_reader :name, :bids
  
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @bidding = true
  end

  def add_bid(attendee, bid)
    return "Pancakes" if @bidding == false
    @bids[attendee] = @bids.fetch(attendee, bid)
  end

  def current_high_bid
    attendee = @bids.max_by {|_, bid| bid}
    attendee[1]
  end

  def close_bidding
    @bidding = false
  end
end