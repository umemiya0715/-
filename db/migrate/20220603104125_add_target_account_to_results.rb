class AddTargetAccountToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :target_account, :string, null: false
  end
end
