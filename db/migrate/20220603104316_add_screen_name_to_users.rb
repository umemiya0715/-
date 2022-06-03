class AddScreenNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :screen_name, :string, null: false
  end
end
