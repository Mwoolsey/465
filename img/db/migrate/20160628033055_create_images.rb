class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.boolean :private
      t.integer :user_id
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
