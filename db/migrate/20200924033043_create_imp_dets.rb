class CreateImpDets < ActiveRecord::Migration[6.0]
  def change
    create_table :imp_dets do |t|
      t.integer :prop_id, comment: "Property ID"
      t.integer :prop_val_yr, comment: "Year"
      t.integer :imprv_id, comment: "Improvement ID"
      t.integer :imprv_det_id, comment: "Improvement Detail ID"
      t.string :Imprv_det_type_cd, limit: 10, comment: "Improvement Detail Type Cd"
      t.string :Imprv_det_type_desc, limit: 25, comment: "Improvement Detail Description"
      t.string :Imprv_det_class_cd, limit: 10, comment: "Class Code"
      t.integer :yr_built, comment: "Year Built"
      t.integer :depreciation_yr, comment: "Depreciation Year"
      t.integer :imprv_det_area, comment: "Area"
      t.integer :imprv_det_val, comment: "Detail Value"
      t.string :sketch_cmds, limit: 500, comment: "Sketch Commands"

      t.timestamps
    end
  end
end
