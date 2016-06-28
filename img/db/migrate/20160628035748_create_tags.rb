class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :str
      t.integer :image_id
      t.references :image, index: true

      t.timestamps null: false
    end
  end
end
