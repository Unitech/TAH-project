class CreateDishSamples < ActiveRecord::Migration
  def change
    create_table :dish_samples do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
