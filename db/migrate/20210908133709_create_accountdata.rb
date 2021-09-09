class CreateAccountdata < ActiveRecord::Migration[6.0]
  def change
    create_table :accountdata do |t|
      t.string :accountdata
      t.timestamps
    end
  end
end
