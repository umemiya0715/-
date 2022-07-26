class AddScreenNameToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :screen_name, :string, null: false, default: ''
  end
end
