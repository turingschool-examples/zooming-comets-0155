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
    if @item.unpopular? == true
      @unpopular_items << @item
    end
  end

end