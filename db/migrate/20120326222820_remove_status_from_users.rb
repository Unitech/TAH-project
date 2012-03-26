class RemoveStatusFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :status
      end

  def down
    add_column :users, :status, :integer
  end
end
