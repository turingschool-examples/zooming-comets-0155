require './lib/auction'
require './lib/item'
require './lib/attendee'

RSpec.describe Auction do
  it 'exists and has attributes' do
    auction = Auction.new
    expect(auction).to be_a(Auction)
    expect(auction.items).to eq([])
  end

  it 'can add items and list item names' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    auction.add_item(item1)
    auction.add_item(item2)

    expect(auction.items).to eq([item1, item2])
    expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
  end

  it 'can return unpopular items' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)

    attendee = Attendee.new({name: 'Megan', budget: '$50'})
    item1.add_bid(attendee, 22)

    expect(auction.unpopular_items).to eq([item2, item3])
  end

  it 'can calculate potential revenue' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})

    item1.add_bid(attendee1, 22)
    item3.add_bid(attendee2, 15)

    expect(auction.potential_revenue).to eq(37)
  end
end

