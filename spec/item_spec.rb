require 'spec_helper'

RSpec.describe Item do
  describe "can ititalize" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    it "can instantiate itself as an object" do
      expect(item1).to be_a Item
      expect(item2).to be_a Item
    end
  end

  describe "can be bid upon" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})

    item1.add_bid(attendee2, 20)

    item1.add_bid(attendee1, 22)

    it "can accept bids on an item" do
      expect(item1.bids).to eq([{attendee2 => 20}, {attendee1 => 22}])
    end

    xit "can track an item's highest bidder" do
      expect(item1.current_high_bid).to eq(22)
    end
  end

  describe "can tell if an item is polular or unpopular" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})

      it "can tell that an item is unpopular" do
        expect(item1.unpopular?).to be true
        expect(item1.unpopular?).to be true
        expect(item1.unpopular?).to be true
      end

    item1.add_bid(attendee2, 20)
    item2.add_bid(attendee1, 30)

      it "can tell that an item is popular" do
        expect(item1.unpopular?).to be false
        expect(item1.unpopular?).to be false
        expect(item1.unpopular?).to be true
      end
  end
end