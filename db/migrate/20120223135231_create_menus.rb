class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :status
      t.string :title
      t.integer :price
      t.text :option
      t.text :description
      t.boolean :participation_cooking
      t.references :table

      t.timestamps
    end
    add_index :menus, :table_id
  end
end
