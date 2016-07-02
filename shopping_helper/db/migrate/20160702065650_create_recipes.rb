class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
