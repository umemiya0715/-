class CreateAnalyzeddata < ActiveRecord::Migration[6.0]
  def change
    create_table :analyzeddata do |t|
      t.string :accountdata
      t.timestamps
    end
  end
end
