require 'spec_helper'

RSpec.describe Auction do
    before(:each) do
        @auction = Auction.new
        @item1 = Item.new('Chalkware Piggy Bank')
        @item2 = Item.new('Bamboo Picture Frame')
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
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
end
