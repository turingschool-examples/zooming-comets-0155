class Attendee 
  @@all_attendees = []
  attr_reader :name, :budget
  
  def initialize(hash)
    @name = hash[:name]
    @budget = hash[:budget]
    @@all_attendees << self
  end

  def self.see_all
    @@all_attendees
  end
end