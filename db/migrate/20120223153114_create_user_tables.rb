class CreateUserTables < ActiveRecord::Migration
  def change
    create_table :user_tables do |t|
      t.references :user
      t.references :table
      t.integer :status

      t.timestamps
    end
    add_index :user_tables, :user_id
    add_index :user_tables, :table_id
  end
end
