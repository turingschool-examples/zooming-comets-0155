class Item
    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = {}
    end

    def add_bid(attendee, bid_amount)
        @bids[attendee] = bid_amount
    end

    def current_high_bid
        current_high_bid = 0
        @bids.each do |__, bid|
         current_high_bid = bid if bid > current_high_bid   
        end
        current_high_bid
    end
end