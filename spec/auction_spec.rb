require './lib/auction'

RSpec.describe Auction do
    it 'has items' do
        auction = Auction.new(items)
    end

    auction.items
    auction.add_item(item1) = "Chalkware Piggy Bank"
    auction.add_item(item2) = "Bamboo Picture Frame"

    auction.item_names = ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
end