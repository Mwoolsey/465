class CreateListRecipes < ActiveRecord::Migration
  def change
    create_table :list_recipes do |t|
      t.references :list, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
