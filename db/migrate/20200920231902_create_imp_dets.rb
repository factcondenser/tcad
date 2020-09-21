class CreateImpDets < ActiveRecord::Migration[6.0]
  def change
    create_table :imp_dets do |t|
      t.integer :prop_id
      t.integer :prop_val_yr
      t.integer :imprv_id
      t.integer :imprv_det_id
      t.string :Imprv_det_type_cd, limit: 10
      t.string :Imprv_det_type_desc, limit: 25
      t.string :Imprv_det_class_cd, limit: 10
      t.integer :yr_built
      t.integer :depreciation_yr
      t.integer :imprv_det_area
      t.integer :imprv_det_val
      t.string :sketch_cmds, limit: 500

      t.timestamps
    end
  end
end
