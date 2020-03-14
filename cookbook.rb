require 'csv'
require_relative 'recipe'
require 'pry-byebug'

class Cookbook
  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    CSV.foreach(open(@csv_path, 'r')) do |row|
      @recipes << Recipe.new(name: row[0], description: row[1], prep_time: row[2],
                             difficulty: row[3], done: row[4])
    end
  end

  def all
    @recipes
  end

  def add_recipe(new_recipe)
    # binding.pry
    @recipes << new_recipe
    CSV.open(@csv_path, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty, recipe.done]
      end
    end
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    CSV.open(@csv_path, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty, recipe.done]
      end
    end
  end

  def complete(index)
    @recipes[index].complete
  end
end
