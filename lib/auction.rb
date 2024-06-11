class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
    end
    
    def item_names
    # binding.pry
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    # binding.pry
    # I want to return the items that have NOT been bid upon.
    # @item_.bids stores bid information
    @items.select do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    # Add highest bids
    # Use #current_high_bid method
    # binding.pry
    revenue = 0
    @items.each do |item|
      revenue += item.current_high_bid.to_i
    end
    revenue
  end


  def bidders
    bidder_names = []
    @items.each do |item|
      if item.bids.empty? == false
        # binding.pry
        bidder_names << item.bids.keys.map do |attendee|
          attendee.name
        end
      end
    end
    bidder_names.flatten
  end
end



