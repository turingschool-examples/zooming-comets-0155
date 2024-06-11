require 'spec_helper'

RSpec.describe Auction do
    before(:each) do
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = Item.new('2 Days Dogsitting')
        @item5 = Item.new('Forever Stamps')

        @auction = Auction.new

        @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
        @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
        @attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    end
    
    it 'exists' do
        expect(@auction).to be_a(Auction)
    end

    it 'has an item' do
        expect(@auction.item).to eq([])
        expect(@auction.item).to be_a(Array)

        @auction.add_item(@item1)

        expect(@auction.item).to eq([@item1])
    end

    it 'can add multiple items' do
        @auction.add_item(@item1)
        @auction.add_item(@item2)

        expect(@auction.item).to eq([@item1, @item2])
    end

    it 'can return item names' do
        @auction.add_item(@item1)
        @auction.add_item(@item2)

        expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end

    it 'can return unpopular items' do
        @item1.add_bid(@attendee2, 20)
        @item1.add_bid(@attendee1, 22)

        @item2.add_bid(@attendee2, 13)

        @auction.add_item(@item1)
        @auction.add_item(@item2)
        @auction.add_item(@item3)
        @auction.add_item(@item4)

        expect(@auction.unpopular_items).to eq([@item3, @item4])
    end

    it 'can return potential_revenue' do
        @item1.add_bid(@attendee2, 20)
        @item1.add_bid(@attendee1, 22)
        @item4.add_bid(@attendee3, 50)
        @item3.add_bid(@attendee2, 15)

        @auction.add_item(@item1)
        @auction.add_item(@item2)
        @auction.add_item(@item3)
        @auction.add_item(@item4)
        @auction.add_item(@item5)

        expect(@auction.unpopular_items).to eq([@item2, @item5])

        expect(@auction.potential_revenue).to eq(87)
    end
end