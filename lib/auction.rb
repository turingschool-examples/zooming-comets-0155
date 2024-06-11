class Auction
    attr_reader :items

    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def unpopular_items
        @items.select { |item | item.bids.empty? }
    end

    def potential_revenue
        @items.sum { |item| item.bids.sum {|__, bid_amount| bid_amount } }
    end

    def bidders
        bidder_names = []
        @items.each do |item|
            item.bids.each_key do |bidder|
                bidder_names << bidder.name
            end
        end
        bidder_names
    end

    def bidder_info
        bidder_info_hash = {}
        @items.each do |item|
          item.bids.each do |bidder, bid_amount|
              if bidder_info_hash[bidder].nil?
                bidder_info_hash[bidder] = { budget: bidder.budget, items: [] }
              end
                bidder_info_hash[bidder][:items] << item.name
          end
        end  
    bidder_info_hash
end