class Attendee 
  attr_reader :name, :budget
  
  def initialize(hash)
    @name = hash[:name]
    @budget = hash[:budget]
  end
end