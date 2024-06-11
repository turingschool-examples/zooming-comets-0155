require './lib/item'

RSpec.describe Item do
    it 'has a name' do
        item = Item.new('Chalkware Piggy Bank')
        expect(item.name).to eq ('Chalkware Piggy Bank')
    end  

    it 'has a name' do
        item2 = Item.new('Bamboo Picture Frame')
        expect(item2.name).to eq ('Bamboo Picture Frame')
    end  
end