class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :region
      t.string :zipcode
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :floor
      t.string :code
      t.string :code2
      t.references :table

      t.timestamps
    end
  end
end
