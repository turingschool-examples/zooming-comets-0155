require './lib/item'

RSpec.describe Item do
  it 'exists and has attributes' do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_a(Item)
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end

  it 'starts with no bids' do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  it 'can add bids' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})

    item1.add_bid(attendee1, 22)
    item1.add_bid(attendee2, 20)

    expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
  end
  
  it 'can return the current highest bid' do 
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})

    item1.add_bid(attendee1, 22)
    item1.add_bid(attendee2, 20)

    expect(item1.current_high_bid).to eq(22)
  end
end
