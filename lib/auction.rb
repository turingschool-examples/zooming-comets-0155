require 'date'

class Auction
    attr_reader :items, :date
  
    def initialize
      @items = []
      @date = Date.today.strftime('%d/%m/%Y')
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
    @items.sum { |item| item.current_high_bid.to_i }
    end

    def bidders
      @items.flat_map { |item| item.bids.keys.map(&:name) }.uniq
    end

    def bidder_info
      info = {}
      @items.each do |item|
        item.bids.each do |attendee, bid|
          info[attendee] ||= { budget: attendee.budget, items: [] } #very handy operator for nil values, remember for future
          info[attendee][:items] << item
        end
      end
      info
    end

    def close_auction
      results = {}
      @items.each do |item|
        item.close_bidding
        highest_bid = item.bids.max { |attendee, bid| bid }
        if highest_bid
          attendee, bid = highest_bid
        if attendee.budget >= bid
            attendee.budget -= bid
            results[item] = attendee
        else
            results[item] = 'Not Sold'
        end
        else
          results[item] = 'Not Sold'
        end
      end
      results
    end
end
  