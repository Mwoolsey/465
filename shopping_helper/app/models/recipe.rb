class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :lists, through: :list_recipes
  has_many :list_recipes
  has_many :ingredients, through: :ingredient_recipes
  has_many :ingredient_recipes, dependent: :destroy
end
