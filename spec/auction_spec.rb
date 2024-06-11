require './spec/spec_helper'

RSpec.describe do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    #=> #<Item:0x00007fbda98fa1b0 @bids={}, @name="Chalkware Piggy Bank">
    
    @item2 = Item.new('Bamboo Picture Frame')
    #=> #<Item:0x00007fbda91874f0 @bids={}, @name="Bamboo Picture Frame">
    
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    #=> #<Attendee:0x00007fbda913f038 @budget=50, @name="Megan">
    
    @auction = Auction.new
    #=> #<Auction:0x00007fbda90f1cc0 @items=[]>
  end

  it "can instantiate" do
    expect(@auction = Auction.new).to be_an_instance_of(Auction)
  end

  it "has can add items & can access item names" do
    expect(@auction.items).to eq([])
    #=> []

    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq(@item1, @item2)
    #=> [#<Item:0x00007fbda98fa1b0 ...>, #<Item:0x00007fbda91874f0 ...>]
  
    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    #=> ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
  end
end