class List < ActiveRecord::Base
  belongs_to :user
  has_many :recipes, through: :list_recipes
  has_many :list_recipes, dependent: :destroy
end
