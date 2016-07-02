json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :str, :float, :str
  json.url ingredient_url(ingredient, format: :json)
end
