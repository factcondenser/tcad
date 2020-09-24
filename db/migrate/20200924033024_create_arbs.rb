class CreateArbs < ActiveRecord::Migration[6.0]
  def change
    create_table :arbs do |t|
      t.integer :prop_id, comment: "Property ID"
      t.integer :prop_val_yr, comment: "Year"
      t.string :geo_id, limit: 50, comment: "Geographic ID"
      t.string :ref_id1, limit: 25, comment: "Ref ID 1"
      t.string :ref_id2, limit: 25, comment: "Ref ID 2"
      t.string :ARB_Status, limit: 10, comment: "ARB Status"

      t.timestamps
    end
  end
end
