class CreateDragons < ActiveRecord::Migration[6.0]
  def change
    create_table :dragons do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :explanation, null: false
      t.string :personality, null: false
      t.string :advice, null: false

      t.timestamps
    end
  end
end
