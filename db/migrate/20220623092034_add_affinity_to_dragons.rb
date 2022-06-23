class AddAffinityToDragons < ActiveRecord::Migration[6.0]
  def change
    add_column :dragons, :affinity, :string, null: false
  end
end
