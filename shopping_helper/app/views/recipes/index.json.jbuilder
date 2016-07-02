json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :str, :user_id, :list_id
  json.url recipe_url(recipe, format: :json)
end
