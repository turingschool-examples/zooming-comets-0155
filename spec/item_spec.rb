require 'rspec'
require './lib/item'

RSpec.describe Item do
    it 'exists' do
        item = Item.new('Chalkware Piggy Bank')
        expect(item).to be_an_instance_of(Item)
    end

    it 'has a name' do
        item = Item.new('Chalkware Piggy Bank')
        expect(item.name).to eq('Chalkware Piggy Bank')
    end
end