require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Auction do
  describe '#initialize' do
    it 'exists with attributes' do
      auction = Auction.new

      expect(auction).to be_a Auction 
      expect(auction.items).to eq []
    end
  end

  describe '#add_item' do
    it "can add items to an array" do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')

      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.items).to eq [item1, item2]
    end
  end

  describe '#item_names' do
    it "can return name of all items within items array as an array" do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')

      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.item_names).to eq ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
    end
  end

  describe '#add_bid' do
    it "can add a bid on an item" do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      item3 = Item.new('Homemade Chocolate Chip Cookies')
      item4 = Item.new('2 Days Dogsitting')
      item5 = Item.new('Forever Stamps')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      auction = Auction.new
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      expect(item1.bids).to eq({})

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      expect(item1.bids).to eq({attendee2 => 20, attendee1 = 22})
    end
  end

end


