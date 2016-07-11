class IngredientRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, presence: true
  validates :quantity_type, presence: true
end
