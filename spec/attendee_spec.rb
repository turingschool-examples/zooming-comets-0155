require './lib/attendee'

RSpec.describe Attendee do
    attr_reader :name, :budget
    it 'has a name' do
        attendee = Attendee.new({name: 'Megan', budget: '$50'})
        expect(attendee.name).to eq ('Megan')
    end  

    it 'has a budget' do
        attendee = Attendee.new({name: 'Megan', budget: '$50'})
        expect(attendee.budget).to eq ('$50')
    end
end