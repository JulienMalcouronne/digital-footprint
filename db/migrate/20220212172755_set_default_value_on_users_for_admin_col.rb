class SetDefaultValueOnUsersForAdminCol < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
