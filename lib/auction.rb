class Auction
    attr_reader :items
  
    def initialize
      @items = []
    end
  
    def add_item(item)
      @items << item
    end
  
    def item_names
      @items.map(&:name)
    end

    def unpopular_items
      @items.find_all { |item| item.bids.empty? }
  end

  def potential_revenue
    @items.sum { |item| item.current_high_bid.to_i }
  end
end
  