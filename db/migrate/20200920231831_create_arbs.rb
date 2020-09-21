class CreateArbs < ActiveRecord::Migration[6.0]
  def change
    create_table :arbs do |t|
      t.integer :prop_id
      t.integer :prop_val_yr
      t.string :geo_id, limit: 50
      t.string :ref_id1, limit: 25
      t.string :ref_id2, limit: 25
      t.string :ARB_Status, limit: 10

      t.timestamps
    end
  end
end
