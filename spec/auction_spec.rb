require 'spec_helper'

RSpec.describe Auction do
    it 'exists' do
        auction = Auction.new
        expect(auction).to be_a(Auction)
    end

    it 'has an item' do
        item1 = Item.new('Chalkware Piggy Bank')
        auction = Auction.new

        expect(auction.item).to be_a(Array)

        auction.add_item(item1)

        expect(auction.item).to eq([item1])
    end

    it 'can add multiple items' do
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        auction = Auction.new

        auction.add_item(item1)
        auction.add_item(item2)

        expect(auction.item).to eq([item1, item2])
    end

    it 'can return item names' do
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        auction = Auction.new

        auction.add_item(item1)
        auction.add_item(item2)

        expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
end