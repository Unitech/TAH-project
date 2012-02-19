class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :phone
      t.text :lang
      t.integer :age
      t.text :description
      t.integer :type
      t.string :job
      
      t.timestamps
    end
  end
end
