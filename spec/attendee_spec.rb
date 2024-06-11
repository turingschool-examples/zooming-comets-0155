require './spec/spec_helper'

RSpec.describe do
  before(:each) do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    #=> #<Attendee:0x00007fbda913f038 @budget=50, @name="Megan">
  end

  it "can instantiate" do
    expect(@attendee).to be_an_instance_of(Attendee)
  end

  it "has a name" do
    expect(@attendee.name).to eq("Megan")
    #=> "Megan"
  end

  it "has a budget" do
    expect(@attendee.budget).to eq(50)
    #=> 50
  end
end

