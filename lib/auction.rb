
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

    #will only return the sum of the current high bids if true, OR will return 0 if nil.
    def potential_revenue
        @item.sum do |item|
            item.current_high_bid || 0
        end
    end
end