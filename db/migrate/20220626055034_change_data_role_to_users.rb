class ChangeDataRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :integer
  end
end
