class Recipe
  attr_reader :name, :description, :prep_time, :difficulty, :done

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @difficulty = attributes[:difficulty]
    @done = false
  end

  def complete
    @done = true
  end
end
