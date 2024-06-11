require './lib/item'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Item do
  describe '#initialize' do
    it 'exists with attributes' do
      item1 = Item.new('Chalkware Piggy Bank')

      expect(item1).to be_a Item
      expect(item1.name).to eq('Chalkware Piggy Bank')
    end
  end

end