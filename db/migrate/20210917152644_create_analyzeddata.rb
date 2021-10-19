class CreateAnalyzeddata < ActiveRecord::Migration[6.0]
  def change
    create_table :analyzeddata do |t|
      t.string :screen_name
      t.timestamps
    end
  end
end
