class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.boolean :available
      t.datetime :start
      t.datetime :end
      t.references :menu

      t.timestamps
    end
    add_index :availabilities, :menu_id
  end
end
