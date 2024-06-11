class Auction
  attr_reader :items
  
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    items_without_bids = []
    @items.each do |item|
      items_without_bids << item if item.bids == {}
    end
    items
  end

  def potential_revenue
    items_with_bids = []
    @items.each do |item|
      items_with_bids << item if item.bids != {}
    end
    item_bids = []
    items_with_bids.each do |item|
      item_bids << item.current_high_bid
    end
    item_bids.sum
  end
end