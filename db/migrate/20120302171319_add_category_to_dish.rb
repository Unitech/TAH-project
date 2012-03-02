class AddCategoryToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :category, :integer

  end
end
