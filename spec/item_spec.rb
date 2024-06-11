require 'spec/spec_helper'

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
end