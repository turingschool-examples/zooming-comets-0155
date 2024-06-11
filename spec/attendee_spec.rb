require 'spec_helper'

RSpec.describe Attendee do
  describe "can ititalize" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})

    it "can instantiate itself as an object" do
      expect(attendee).to be_a Attendee
      expect(attendee.name).to eq('Megan')
      expect(attendee.budget).to eq(50)
      
    end
  end
end