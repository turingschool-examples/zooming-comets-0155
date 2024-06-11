require 'spec_helper'
require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  describe 'initialize' do
    it 'exists' do
      expect(@item1).to be_an_instance_of(Item)
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item1.bids).to eq({})
    end
  end

  describe 'add_bid' do
    it 'adds a bid' do
      @item1.add_bid(@attendee, 20)
      expect(@item1.bids).to eq({@attendee => 20})
    end
  end

  describe 'current_high_bid' do
    it 'gives the highest bid' do
      @item1.add_bid(@attendee, 20)
      expect(@item1.current_high_bid).to eq(20)
    end
  end
end
