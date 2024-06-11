class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @can_bid = true
  end

  def add_bid(attendee, bid)
    # binding.pry
    # Fixed. Needed to call `name` of attendee, not just `attendee`
      # Maybe not fixed once I added the @can_bid it no longer works
      # Not sure what the bug is.
    if @can_bid
      # binding.pry
      @bids[attendee] = bid
    else
      false
    end
  end

  def current_high_bid
    # binding.pry
    # Call `.max` on ALL the values stored in `@bids`
    @bids.values.max
  end

  def close_bidding
    @can_bid = false
  end
end

