class Item
attr_reader :bids, :name, :unpopular
  def initialize(name)
    @bids = {}
    @name = name
    @unpopular = false
  end

  def add_bid(name, bid_amount)
    @bids[name] = bid_amount
  end

  def current_high_bid
    bids_array = @bids.max_by{|k, v| v}
      bids_array.last
  end

  def unpopular?
    return true if @bids = {}
    return false if @bids.!empty
  end
end
