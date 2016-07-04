class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :ingredient_recipes
  has_many :ingredient_recipes
  
end
