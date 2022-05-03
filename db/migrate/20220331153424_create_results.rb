class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :user, null: false
      t.references :dragon, null: false
      t.float   :score, null: false
      t.float   :magnitude, null: false
      t.float   :troversion, null: false

      t.timestamps
    end
  end
end
