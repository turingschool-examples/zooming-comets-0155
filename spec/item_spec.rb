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
    expect(@item1).to be_an_instance_of(Item)
    expect(@item2).to be_an_instance_of(Item)
  end

  it "has a name" do
    expect(@item1.name).to eq("Chalkware Piggy Bank")
    #=> "Chalkware Piggy Bank"
  end

  it "can place bids on items" do
    @auction.add_item(@item1)

    # Bids not yet placed on any `item`
    expect(@item1.bids).to eq({})
    #=> {}
    
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@item1.bids).to eq({@attendee1 => 22, @attendee2 => 20})
    #=> {
    #     #<Attendee:0x00007fdc071131c8 ...> => 20,
    #     #<Attendee:0x00007fdc088f0e08 ...> => 22
    #   }
  end

  it "can have a current high bid" do
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    
    expect(@item1.current_high_bid).to eq(22)
    #=> 22
  end

  it "disables bidding on an item when called on that item" do
    @auction.add_item(@item1)
    @item1.add_bid(@attendee1, 22)
    
    @item1.close_bidding

    expect(@item1.add_bid(@attendee2, 42)).to be(false)
  end
end

