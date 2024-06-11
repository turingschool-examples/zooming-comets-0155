require 'rspec'
require './lib/item'
require './lib/auction'
require './lib/attendee'


RSpec.describe Item do
    before(:each) do
        @item1 = item1 = Item.new('Chalkware Piggy Bank')
        @item2 = item2 = Item.new('Bamboo Picture Frame')
        @item3 = item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = item4 = Item.new('2 Days Dogsitting')
        @item5 = item5 = Item.new('Forever Stamps')
    end

    it 'exists' do
        expect(@item1).to be_an_instance_of(Item)
    end
    
    it 'has a name' do
        expect(@item1.name).to eq('Chalkware Piggy Bank')
    end

    it 'can make a second item' do
        expect(@item2.name). to eq('Bamboo Picture Frame')
    end

    it 'starts items with empty bids hash' do
        expect(@item1.bids).to eq({})
        expect(@item2.bids).to eq({})
    end


end