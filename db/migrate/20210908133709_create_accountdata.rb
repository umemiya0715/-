class CreateAccountdata < ActiveRecord::Migration[6.0]
  def change
    create_table :accountdata do |t|
      t.string :screen_name
      t.timestamps
    end
  end
end
