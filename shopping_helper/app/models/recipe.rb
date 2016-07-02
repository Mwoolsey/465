class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients, dependent: :destroy
end
