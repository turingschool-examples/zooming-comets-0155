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
        @attendee1 = attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
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

    it 'can add a bid to an item' do
        @item1.add_bid(@attendee2, 20)
        @item1.add_bid(@attendee1, 22)
        current_bids = {@attendee2 => 20, @attendee1 => 22}
        expect(@item1.bids).to eq(current_bids)
    end

    it 'knows the current_high_bid' do
        @item1.add_bid(@attendee2, 20)
        @item1.add_bid(@attendee1, 22)
        expect(@item1.current_high_bid).to eq(22)
    end


end