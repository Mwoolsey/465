class CreateReferences < ActiveRecord::Migration

  def change
    create_table :references do |t|
      t.references :topic, index: true, foreign_key: true
      t.text :URL
      t.timestamps
    end
  end

end
