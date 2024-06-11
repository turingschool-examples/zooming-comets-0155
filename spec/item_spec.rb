require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = Item.new('2 Days Dogsitting')
        @item5 = Item.new('Forever Stamps')
        @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
        @auction = Auction.new
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@item1).to be_an_instance_of(Item)
            expect(@item1.name).to eq('Chalkware Piggy Bank')
            expect(@item1.bids).to eq({})
        end
    end

    describe '#add_bid' do
        it 'can add attendees and their bids to items' do 
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            expect(@item1.bids[@attendee2]).to eq(20)
            expect(@item1.bids[@attendee1]).to eq(22)
        end
    end
end
