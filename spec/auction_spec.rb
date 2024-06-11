require 'spec_helper'

RSpec.describe Auction do
  
  describe "can ititalize" do
    auction = Auction.new

    it "can instantiate itself as an object" do
      expect(auction).to be_a Auction
    end
    it "initializes with an empty items array" do
      expect(auction.items).to eq([])
    end
  end

  describe "can add items and their names to its catalogue" do
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)

    xit "can store Item objects to its catalogue" do
      expect(auction.items).to eq[item1, item2]
    end
    it "can return the names of Items in catalogue as an array of strings" do
      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe "can run an auction" do
    auction = Auction.new

    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    item4.add_bid(attendee3, 50)

    it "can recognize and display unpopular auction items" do
      expect(auction.unpopular_items).to eq(item2, item3, item5)
    end

    item3.add_bid(attendee2, 15)

    it "can update and display unpopular auction items as bidding progresses" do
      expect(auction.unpopular_items).to eq(item2, item5)
    end

    xit "can predict auction revenue potential" do
      expect(auction.potential_revenue).to eq(87)
    end
  end
end