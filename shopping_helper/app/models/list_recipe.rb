class ListRecipe < ActiveRecord::Base
  belongs_to :list
  belongs_to :recipe
end
