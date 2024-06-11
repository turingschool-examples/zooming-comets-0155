require 'spec_helper'

RSpec.describe Item do
    it 'exists' do
        item1 = Item.new('Chalkware Piggy Bank')
        expect(item1).to be_a(Item)
        expect(item1.name).to eq('Chalkware Piggy Bank')
        expect(item1.bids).to eq({})
    end
end