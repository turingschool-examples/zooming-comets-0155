
class Auction
    attr_reader :item

    def initialize
        @item = []
    end

    def add_item(item)
        @item << item
    end

    def item_names
        @item.map do |item|
            item.name
        end
    end

    #legit enumerable .find_all makes this easy.
    def unpopular_items
        @item.find_all do |item|
            item.bids.empty?
        end
    end
end