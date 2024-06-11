require 'rspec'
require './lib/auction'
require './lib/item'

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
        @item1 = item1 = Item.new('Chalkware Piggy Bank')
        @item2 = item2 = Item.new('Bamboo Picture Frame')
        @item3 = item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = item4 = Item.new('2 Days Dogsitting')
        @item5 = item5 = Item.new('Forever Stamps')
    end
    it 'exists' do
        expect(@auction).to be_an_instance_of(Auction)
    end

    it 'initializes with an empty array' do
        expect(@auction.items).to eq([])
    end

    describe '#add_item' do
        it 'can add items to the auction' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            expect(@auction.items).to eq([@item1, @item2])
        end
    end

end