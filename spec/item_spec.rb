require 'rspec'
require './lib/item'

RSpec.describe Item do
    it 'exists' do
        item1 = Item.new('Chalkware Piggy Bank')
    end
    
    it 'has a name' do
        item1 = Item.new('Chalkware Piggy Bank')
        expect(item1.name).to eq('Chalkware Piggy Bank')
    end

    it 'can make a second item' do
        item2 = Item.new('Bamboo Picture Frame')
        expect(item2.name). to eq('Bamboo Picture Frame')
    end

    it 'starts items with empty bids hash' do
        item1 = Item.new('Chalkware Piggy Bank')
        expect(item1.bids).to eq({})
        item2 = Item.new('Bamboo Picture Frame')
        expect(item2.bids).to eq({})
    end
end