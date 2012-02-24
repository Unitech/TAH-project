class AddPositionToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :position, :integer

  end
end
