require 'rspec'
require './lib/auction'
require './lib/item'
require './lib/attendee'

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

    describe '#unpopular_items' do
        it 'can say which items have no bids' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)
            expect(@auction.unpopular_items).to eq([@item1, @item2, @item5])
        end
    end

    describe '#potential_revenue' do
        it 'can add the bids to say how much the auction could make' do
            @auction.add_item(@item1)
            @auction.add_item(@item2)
            @auction.add_item(@item3)
            @auction.add_item(@item4)
            @auction.add_item(@item5)
            @item4.add_bid(@attendee3, 50)
            @item3.add_bid(@attendee2, 15)
            expect(@auction.potential_revenue).to eq(65)
        end
    end

    describe '#bidders' do
        it "returns an array of bidders names as strings" do
        @auction.add_item(@item1)
        @auction.add_item(@item2)  
        @item1.add_bid(@attendee1, 20)
        @item2.add_bid(@attendee2, 25)
        @item2.add_bid(@attendee3, 30)
        expect(@auction.bidders).to eq("Megan", "Bob", "Mike")
    end
end