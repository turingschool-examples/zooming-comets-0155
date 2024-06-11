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

    def bidders
        bidders = []

        @items.each do |item|
            item.bids.keys.each { |bidder| bidders << bidder.name }
        end

        bidders.uniq
    end

    def bidder_info
        bidder = Hash.new { |hash, key| hash[key] = {budget: 0, items: [] }}

        @items.each do |item|
            item.bids.each do |attendee, bid|
                bidder[attendee][:budget] = attendee.budget
                bidder[attendee][:items] << item
            end
        end

        bidder
    end
end