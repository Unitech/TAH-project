class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :title
      t.text :description
      t.integer :capacity
      t.references :user
      t.boolean :table_available
      t.string :theme
      t.timestamps
    end
    add_index :tables, :user_id
  end
end
