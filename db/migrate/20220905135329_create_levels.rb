class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels do |t|
      t.references :user, null: false
      t.integer :current_level, null: false, default: 1
      t.integer :experience, null: false, default: 0

      t.timestamps
    end
  end
end
