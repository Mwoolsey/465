json.array!(@ingredient_recipes) do |ingredient_recipe|
  json.extract! ingredient_recipe, :id, :recipe_id, :ingredient_id
  json.url ingredient_recipe_url(ingredient_recipe, format: :json)
end
