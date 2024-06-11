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
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq([item1, item2])
  end

  it 'can list item names' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
  end

  it 'can list items that are not popular' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.unpopular_items).to eq([item1, item2])
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    item1.add_bid(attendee1, 20)
    expect(auction.unpopular_items).to eq([item2])
  end

  it 'can calculate revenue' do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    item1.add_bid(attendee1, 20)
    item1.add_bid(attendee2, 22)
    item2.add_bid(attendee1, 30)
    expect(auction.potential_revenue).to eq(52)
  end
end
