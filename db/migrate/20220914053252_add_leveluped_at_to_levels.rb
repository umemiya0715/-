class AddLevelupedAtToLevels < ActiveRecord::Migration[7.0]
  def change
    add_column :levels, :leveluped_at, :datetime
  end
end
