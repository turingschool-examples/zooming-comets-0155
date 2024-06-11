class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(attendee, bid)
    # binding.pry
    # Fixed. Needed to call `name` of attendee, not just `attendee`
    @bids[attendee.name] = bid
  end

  def current_high_bid
    # binding.pry
    # Call `.max` on ALL the values stored in `@bids`
    @bids.values.max
  end
end

