class List < ActiveRecord::Base
  belongs_to :user
  has_many :recipes, through: :list_recipes
  has_many :list_recipes

  accepts_nested_attributes_for :recipes
  
  def recipes_not_used
    recipes = Recipe.all - self.recipes
    recipes.map {|recipe| [recipe.name, recipe.id]}
  end
end
