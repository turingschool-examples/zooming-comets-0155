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
    @items.select { |item| item.bids.empty? }
  end

  def potential_revenue
    @items.sum { |item| item.current_high_bid.to_i}
  end

  def bidders
    @items.flat_map { |item| item.bids.keys.map(&:name)}.uniq
  end

  def bidder_info
    info = {}
    @items.each do |item|
      item.bids.each do |attendee, amount|
        info[attendee] ||= { budget: attendee.budget, items: [] }
        info[attendee][:items] << item
      end
    end
    info
  end
end