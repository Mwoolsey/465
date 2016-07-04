json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :quantity, :quantity_type
  json.url ingredient_url(ingredient, format: :json)
end
