require 'spec_helper'
require './lib/auction'
require './lib/item'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  describe 'initialize' do
    it 'exists' do
      expect(@auction).to be_an_instance_of(Auction)
      expect(@auction.items).to eq([])
    end
  end

  describe 'add_item' do
    it 'adds items to auction' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end
  end

  describe 'item_names' do
    it 'lists item names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end

  describe 'unpopular items' do
    it 'identifies unpopular items' do 
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee1, 40)
      @item1.add_bid(@attendee2, 50)
      @item5.add_bid(@attendee3, 25)

      expect(@auction.unpopular_items).to eq([@item2, @item3, @item4])

      @item4.add_bid(@attendee3, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item3])
    end
  end

  describe 'potential revenue' do
    it 'calculates potential revenue' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee1, 20)
      @item1.add_bid(@attendee2, 28)
      @item4.add_bid(@attendee3, 45)
      @item3.add_bid(@attendee2, 10)

      expect(@auction.potential_revenue).to eq(83)
    end
  end

  describe 'bibbers' do
    it 'lists names of the bidders' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @item1.add_bid(@attendee1, 10)
      @item2.add_bid(@attendee2, 15)
      @item2.add_bid(@attendee3, 20)

      expect(@auction.bidders).to eq(['Megan', 'Bob', 'Mike'])
    end
  end

  describe 'bidder info' do
    it 'returns bidder info ' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)

      @item1.add_bid(@attendee1, 20)
      @item1.add_bid(@attendee2, 28)
      @item4.add_bid(@attendee3, 45)
      @item3.add_bid(@attendee2, 10)
  
      bidder_info = @auction.bidder_info

      binding.pry

    
  
      expect(bidder_info[@attendee1]).to eq({ budget: 50, items: [@item1] })
      expect(bidder_info[@attendee2]).to eq({ budget: 75, items: [@item1, @item3] })
      expect(bidder_info[@attendee3]).to eq({ budget: 100, items: [@item4] })
    end
  end

  


end