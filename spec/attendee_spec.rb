require './lib/item'
require './lib/attendee'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Attendee do
  describe '#initialize' do
    it 'exists with attributes' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      attendee = Attendee.new({name: 'Megan', budget: '$50'})

      expect(attendee).to be_a Attendee 
      expect(attendee.name).to eq('Megan')
      expect(attendee.budget).to eq('$50')
    end
  end

end