class ChangeAccountdataToAccounts < ActiveRecord::Migration[6.0]
  def change
    rename_table :accountdata, :accounts
  end
end
