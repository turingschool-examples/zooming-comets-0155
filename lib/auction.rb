require_relative 'attendee'


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

    #this iterates the item array. each @item is an instance of the Item class. It also has an instance of the Attendee class.
    #this method creates a hash of the attendees who have bid on the items, and the items they have bid on. 
    def bidder_info
        bidder_info = {}
        @item.each do |item|
            item.bids.each do |attendee, bid|
                if bidder_info[attendee].nil?
                    bidder_info[attendee] = {budget: attendee.budget, items: [item]}
                else
                    bidder_info[attendee][:items] << item
                end
            end
        end
        bidder_info
    end
end