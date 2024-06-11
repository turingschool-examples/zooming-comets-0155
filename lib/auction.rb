class Auction
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        @items.push(item)
    end

    def item_names
        @items.map(&:name)
    end

    def unpopular_items
        @items.select { |item| item.bids.empty? }
    end

    def potential_revenue
        @items.map { |item| item.bids.values.max || 0 }.sum
    end
end