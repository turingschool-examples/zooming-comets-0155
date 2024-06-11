require 'spec_helper'

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @item3 = Item.new('Homemade Chocolate Chip Cookies')
        @item4 = Item.new('2 Days Dogsitting')
        @item5 = Item.new('Forever Stamps')
        @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@auction).to be_an_instance_of(Auction)
            expect(@auction.items).to eq([])
        end
    end

    describe '#add_item + #item_names' do
        it 'should add items to an auction' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            expect(@auction.items).to eq([@item1, @item2])
            expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
        end
    end

    describe '#unpopular_items' do
        it 'returns the items with no bids' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)

            expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
            @item3.add_bid(@attendee2, 15)
            expect(@auction.unpopular_items).to eq([@item2, @item5])
        end
    end

    describe '#potential_revenue' do
        it 'returns the total possible sale price of the items (sum of highest bids)' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)

            expect(@auction.potential_revenue).to eq(87)
        end
    end

    describe '#bidders' do
        it 'returns an array of all Bidder names as Strings' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            @item1.add_bid(@attendee2, 20)
            @item1.add_bid(@attendee1, 22)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)

            expect(@auction.bidders).to eq(['Bob', 'Megan', 'Mike'])
        end
    end
end
