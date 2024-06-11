class Auction
  attr_reader :items, :item_names, :unpopular_items

  def initialize
    @items = []
    @item_names = []
    @unpopular_items = []
  end

  def add_item(item)
    @items << item
    @item_names << item.name
  end

  def unpopular_items
    @items.map {|item| item.unpopular?}
      @unpopular_items << @item
    end
  end

  def potential_revenue
    highest_bid_array = @items.map {|item| item.current_high_bid}
    highest_bid_array.sum
  end

end