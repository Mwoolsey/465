json.array!(@list_recipes) do |list_recipe|
  json.extract! list_recipe, :id, :list_id, :recipe_id
  json.url list_recipe_url(list_recipe, format: :json)
end
