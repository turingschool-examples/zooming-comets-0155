require 'rspec'
require './lib/auction'
require './lib/item'

RSpec.describe Auction do
  it 'exists' do
    auction = Auction.new
    expect(auction).to be_an_instance_of(Auction)
  end

  it 'has items' do
    auction = Auction.new
    expect(auction.items).to eq([])
  end

  it 'can add items' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    expect(auction.items).to eq([item1, item2, item3, item4, item5])
  end

  it 'can list item names' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    expect(auction.item_names).to eq([
      'Chalkware Piggy Bank', 
    'Bamboo Picture Frame',
     'Homemade Chocolate Chip Cookies',
    '2 Days Dogsitting',
    'Forever Stamps'])
  end

  it 'can list items that are not popular' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    expect(auction.unpopular_items).to eq([item1, item2, item3, item4, item5])
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    item1.add_bid(attendee1, 20)
    item1.add_bid(attendee2, 22)
    item4.add_bid(attendee2, 50)
    item3.add_bid(attendee2, 15)
    expect(auction.unpopular_items).to eq([item2, item5])
  end

  it 'can calculate revenue' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    item1.add_bid(attendee1, 20)
    item1.add_bid(attendee2, 22)
    item4.add_bid(attendee2, 50)
    item3.add_bid(attendee2, 15)
    expect(auction.potential_revenue).to eq(87)
  end

  it 'can list bidders' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    item1.add_bid(attendee1, 20)
    item1.add_bid(attendee2, 22)
    expect(auction.bidders).to eq(['Megan', 'Bob'])
  end

  it 'can provide bidder info' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    item1.add_bid(attendee1, 20)
    item1.add_bid(attendee2, 22)
    expected = {
      attendee1 => { budget: 50, items: [item1] },
      attendee2 => { budget: 75, items: [item1] }
    }
    expect(auction.bidder_info).to eq(expected)
  end

  it 'can close bidding on an item' do
    item = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    item.add_bid(attendee1, 20)
    item.close_bidding
    item.add_bid(attendee1, 25)
    expect(item.bids).to eq({ attendee1 => 20 })
  end

  it 'returns auction date' do
    auction = Auction.new
    allow(Date).to receive(:today).and_return(Date.new(2024, 6, 11))
    expect(auction.date).to eq('11/06/2024')
  end
end
