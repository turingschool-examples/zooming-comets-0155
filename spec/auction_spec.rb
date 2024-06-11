require './spec/spec_helper'

RSpec.describe do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    #=> #<Item:0x00007fbda98fa1b0 @bids={}, @name="Chalkware Piggy Bank">
    
    @item2 = Item.new('Bamboo Picture Frame')
    #=> #<Item:0x00007fbda91874f0 @bids={}, @name="Bamboo Picture Frame">

    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    #=> #<Item:0x00007fdc071ab040 @bids={}, @name="Homemade Chocolate Chip Cookies">
    
    @item4 = Item.new('2 Days Dogsitting')
    #=> #<Item:0x00007fdc088fb6f0 @bids={}, @name="2 Days Dogsitting">
    
    @item5 = Item.new('Forever Stamps')
    #=> #<Item:0x00007fdc071695f0 @bids={}, @name="Forever Stamps">
    
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    #=> #<Attendee:0x00007fbda913f038 @budget=50, @name="Megan">
    
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    #=> #<Attendee:0x00007fdc071131c8 @budget=75, @name="Bob">
    
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    #=> #<Attendee:0x00007fdc070e2190 @budget=100, @name="Mike">
    
    @auction = Auction.new
    #=> #<Auction:0x00007fbda90f1cc0 @items=[]>
  end

  it "can instantiate" do
    expect(@auction = Auction.new).to be_an_instance_of(Auction)
  end

  it "has can add items" do
    expect(@auction.items).to eq([])
    #=> []

    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq([@item1, @item2])
    #=> [#<Item:0x00007fbda98fa1b0 ...>, #<Item:0x00007fbda91874f0 ...>]
    end
    
  it "can access item names" do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    #=> ["Chalkware Piggy Bank", "Bamboo Picture Frame"] 
  end

  it "can have unpopular items" do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    
    # binding.pry

    expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
    #=> [#<Item:0x00007fdc07925280 ...>, #<Item:0x00007fdc071ab040 ...>, #<Item:0x00007fdc071695f0 ...>]

    @item3.add_bid(@attendee2, 15)
  
    # #unpopular_items array changes when @item3 receives a bid
    expect(@auction.unpopular_items).to eq([@item2, @item5])
    #=> [#<Item:0x00007fdc07925280 ...>, #<Item:0x00007fdc071695f0 ...>]
  end

  it "counts potential revenue" do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    
    # Only highest bids are counted
    expect(@auction.potential_revenue).to eq(87)
    #=> 87
  end

  it "returns bidders names as strings in an array" do
    expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
  end
end

