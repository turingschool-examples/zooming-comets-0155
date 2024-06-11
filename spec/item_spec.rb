require 'rspec'
require './lib/item'

RSpec.describe Item do
    it 'exists' do
        item = Item.new('Chalkware Piggy Bank')
        expect(item).to be_an_instance_of(Item)
    end

    it 'has a name' do
        item = Item.new('Chalkware Piggy Bank')
        expect(item.name).to eq('Chalkware Piggy Bank')
    end

    it 'adds bids' do
        item = Item.new('Chalkware Piggy Bank')
        attendee1 = Attendee.new({name: 'Megan', :budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', :budget '$75'})
        attendee3 = Attendee.new({name: 'Mike', :budget '$100'})
        item.add_bid(attendee1, 20)
        item.add_bid(attendee2, 22)
        item.add_bid(attendee3, 0)
        expected_bids = {attendee1 => 20, attendee2 => 22}
        expect(item.bids).to eq(expected_bids)
    end

    it 'can show the highest bid' do
        item = Item.new('Chalkware Piggy Bank')
        attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        item.add_bid(attendee1, 20)
        item.add_bid(attendee2, 22)
        expect(item.current_high_bid).to eq(22)
      end


end