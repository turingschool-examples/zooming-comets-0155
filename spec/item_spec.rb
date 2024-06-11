require './spec/spec_helper'

RSpec.describe do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    #=> #<Item:0x00007fbda98fa1b0 @bids={}, @name="Chalkware Piggy Bank">
    
    @item2 = Item.new('Bamboo Picture Frame')
    #=> #<Item:0x00007fbda91874f0 @bids={}, @name="Bamboo Picture Frame">
  end

  it "can instantiate" do
    expect(@item1).to be_an_instance_of(Item)
    expect(@item2).to be_an_instance_of(Item)
  end

  it "has a name" do
    expect(@item1.name).to eq("Chalkware Piggy Bank")
    #=> "Chalkware Piggy Bank"
  end

  it "can place bids on items & have a high bid" do
    @auction.add_item(item1)

    # Bids not yet placed on any `item`
    expect(@item1.bids).to eq({})
    #=> {}
    
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    expect(@item1.bids).to eq({@attendee1: 22, @attendee2: 20})
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
end