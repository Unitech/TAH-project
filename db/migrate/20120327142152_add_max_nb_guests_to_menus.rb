class AddMaxNbGuestsToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :max_guests, :integer, :default => MAX_GUESTS_PER_MENU

  end
end
