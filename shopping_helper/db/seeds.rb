# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create(
  [
    { email: 'a@a.com', name: "Mr. Aardvark", password: "a", password_confirmation: "a"},
    { email: 'b@b.com', name: "Mr. Bear", password: "b", password_confirmation: "b"},
    { email: 'c@c.com', name: "Mr. Cat", password: "c", password_confirmation: "c"},
    { email: 'd@d.com', name: "Mr. Dog", password: "d", password_confirmation: "d"},
    { email: 'e@e.com', name: "Mr. Elephant", password: "e", password_confirmation: "e"},
    { email: 'f@f.com', name: "Mr. Fox", password: "f", password_confirmation: "f"},
    { email: 'g@g.com', name: "Mr. Gopher", password: "g", password_confirmation: "g"},
    { email: 'h@h.com', name: "Mr. Horse", password: "h", password_confirmation: "h"},
    { email: 'i@i.com', name: "Mr. Iguana", password: "i", password_confirmation: "i"},
    { email: 'j@j.com', name: "Mr. Jackrabbit", password: "j", password_confirmation: "j"},
    { email: 'k@k.com', name: "Mr. Kangaroo", password: "k", password_confirmation: "k"},
    { email: 'l@l.com', name: "Mr. Llama", password: "l", password_confirmation: "l"},
    { email: 'm@m.com', name: "Mr. Mouse", password: "m", password_confirmation: "m"},
    { email: 'n@n.com', name: "Mr. Numbat", password: "n", password_confirmation: "n"},
    { email: 'o@o.com', name: "Mr. Opossum", password: "o", password_confirmation: "o"},
    { email: 'p@p.com', name: "Mr. Peacock", password: "p", password_confirmation: "p"},
    { email: 'q@q.com', name: "Mr. Quail", password: "q", password_confirmation: "q"},
    { email: 'r@r.com', name: "Mr. Rabbit", password: "r", password_confirmation: "r"},
    { email: 's@s.com', name: "Mr. Snake", password: "s", password_confirmation: "s"},
    { email: 't@t.com', name: "Mr. Tiger", password: "t", password_confirmation: "t"},
    { email: 'u@u.com', name: "Mr. Urial", password: "u", password_confirmation: "u"},
    { email: 'v@v.com', name: "Mr. Vulture", password: "v", password_confirmation: "v"},
    { email: 'w@w.com', name: "Mr. Wombat", password: "w", password_confirmation: "w"},
    { email: 'x@x.com', name: "Mr. Xenons", password: "x", password_confirmation: "x"},
    { email: 'y@y.com', name: "Mr. Yak", password: "y", password_confirmation: "y"},
    { email: 'z@z.com', name: "Mr. Zebra", password: "z", password_confirmation: "z"},
  ]
)

lists = List.create(
  [

    { user_id: 1 },
    { user_id: 2 },
    { user_id: 3 },
    { user_id: 4 },
    { user_id: 5 },
    { user_id: 6 },
    { user_id: 7 },
    { user_id: 8 },
    { user_id: 9 },
    { user_id: 10 },
    { user_id: 11 },
    { user_id: 12 },
    { user_id: 13 },
    { user_id: 14 },
    { user_id: 15 },
    { user_id: 16 },
    { user_id: 17 },
    { user_id: 18 },
    { user_id: 19 },
    { user_id: 20 },
    { user_id: 21 },
    { user_id: 22 },
    { user_id: 23 },
    { user_id: 24 },
    { user_id: 25 },
    { user_id: 26 }
  ]
)

recipes = Recipe.create(
  [
    { name: 'Sandwich, Cheese', user_id: (1 + rand(26)) },
    { name: 'Meatloaf', user_id: (1 + rand(26)) },
    { name: 'Spaghetti', user_id: (1 + rand(26)) },
    { name: 'Casserole, Chicken', user_id: (1 + rand(26)) },
    { name: 'Chicken-n-Rice', user_id: (1 + rand(26)) },
    { name: 'Broccoli Beef', user_id: (1 + rand(26)) },
    { name: 'Taco, Chicken', user_id: (1 + rand(26)) },
    { name: 'Taco, Beef', user_id: (1 + rand(26)) },
    { name: 'Taco, Shrimp', user_id: (1 + rand(26)) },
    { name: 'Burrito, Chicken', user_id: (1 + rand(26)) },
    { name: 'Burrito, Beef', user_id: (1 + rand(26)) },
    { name: 'Burrito, Shrimp', user_id: (1 + rand(26)) },
    { name: 'Sweet Roll', user_id: (1 + rand(26)) },
    { name: 'Taco Salad', user_id: (1 + rand(26)) },
    { name: 'Manicotti', user_id: (1 + rand(26)) },
    { name: 'Pie, Blackberry', user_id: (1 + rand(26)) },
    { name: 'Pie, Cherry', user_id: (1 + rand(26)) },
    { name: 'Pie, Apple', user_id: (1 + rand(26)) },
    { name: 'Fudge', user_id: (1 + rand(26)) },
    { name: 'Sandwich, BLT', user_id: (1 + rand(26)) },
    { name: 'Cake, Chololate', user_id: (1 + rand(26)) },
    { name: 'Cookie, Chocolate Chip', user_id: (1 + rand(26)) },
    { name: 'Cookie, Snickerdoodle', user_id: (1 + rand(26)) },
    { name: 'Sandwich, Turkey', user_id: (1 + rand(26)) },
    { name: 'Tri-tip Steak', user_id: (1 + rand(26)) },
    { name: 'New York Steak', user_id: (1 + rand(26)) },
    { name: 'Fajitas, Chicken', user_id: (1 + rand(26)) },
    { name: 'Fajitas, Steak', user_id: (1 + rand(26)) },
    { name: 'Fajitas, Shrimp', user_id: (1 + rand(26)) },
    { name: 'Kabobs', user_id: (1 + rand(26)) },
    { name: 'Stuffed Zuchinni', user_id: (1 + rand(26)) },
    { name: 'Cheesecake, Smores', user_id: (1 + rand(26)) },
    { name: 'Stuffed Pork Chops', user_id: (1 + rand(26)) },
    { name: 'Meatballs', user_id: (1 + rand(26)) },
    { name: 'Salsbury Steak', user_id: (1 + rand(26)) },
    { name: 'Soup, curry', user_id: (1 + rand(26)) },
    { name: 'Pulled Pork', user_id: (1 + rand(26)) },
    { name: 'Break, Pumpkin', user_id: (1 + rand(26)) },
    { name: 'Candied Apricots', user_id: (1 + rand(26)) },
    { name: 'Salad, Ceasar', user_id: (1 + rand(26)) }
  ]
)

(1..200).each {|x| ListRecipe.create( [ { list_id: (1 + rand(26)), recipe_id: (1 + rand(40)) } ] )}

=begin
list_recipes = ListRecipe.create(
  [
    { list_id: (1 + rand(26)), recipe_id: (1 + rand(40)) }
  ]
)
=end

ingredients = Ingredient.create(
  [
    { name: 'Pepper' },
    { name: 'Salt' },
    { name: 'Milk' },
    { name: 'Butter' },
    { name: 'Egg' },
    { name: 'Yogurt' },
    { name: 'Vanilla' },
    { name: 'Onion' },
    { name: 'Tomato' },
    { name: 'Oil' },
    { name: 'Tortilla' },
    { name: 'Turkey Breast' },
    { name: 'Beef Stock' },
    { name: 'Squash' },
    { name: 'Sugar' },
    { name: 'Relish' },
    { name: 'Rhubarb' },
    { name: 'Radish' },
    { name: 'Plum' },
    { name: 'Pineapple' },
    { name: 'Pickle' },
    { name: 'Penne' },
    { name: 'Peanut' },
    { name: 'Parsley' },
    { name: 'Mint' },
    { name: 'Marinara' },
    { name: 'Lettuce' },
    { name: 'Bean' },
    { name: 'Ketchup' },
    { name: 'Honey' },
    { name: 'Melon' },
    { name: 'Gin' },
    { name: 'Flour' }
  ]
)

(1..200).each do |x| 
  if x.even?
    unit = "Cup"
  else
    unit = "Tsp"
  end
  IngredientRecipe.create( { recipe_id: (1 + rand(40)), ingredient_id: (1 + rand(33)), quantity_type: unit, quantity: (0.1 + rand(4.0)).round(2)} ) 
end

ir_list = IngredientRecipe.all

