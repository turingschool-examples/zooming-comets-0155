class Attendee
  attr_reader :name,
              :budget

  def initialize(data)
    @name = data[:name]
    @budget = data[:budget]
    end
    
  def budget
    @budget.gsub('$', '').to_i
  end
end