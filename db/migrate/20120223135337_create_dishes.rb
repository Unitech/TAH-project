class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title
      t.text :description
      t.references :menu

      t.timestamps
    end
    add_index :dishes, :menu_id
  end
end
