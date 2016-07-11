class Recipe < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :lists, through: :list_recipes
  has_many :list_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_many :ingredient_recipes, dependent: :destroy

  accepts_nested_attributes_for :ingredient_recipes, allow_destroy: true

  def ingredients_not_used
    ingredients = Ingredient.all - self.ingredients
    ingredients.map {|ingredient| [ingredient.name, ingredient.id]}
  end

end
