class CreateArbitrations < ActiveRecord::Migration[6.0]
  def change
    create_table :arbitrations do |t|
      t.integer :prop_id
      t.integer :prop_val_yr
      t.string :geo_id, limit: 50
      t.string :ref_id1, limit: 25
      t.string :ref_id2, limit: 25

      t.timestamps
    end
  end
end
