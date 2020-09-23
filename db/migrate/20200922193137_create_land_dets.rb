class CreateLandDets < ActiveRecord::Migration[6.0]
  def change
    create_table :land_dets do |t|
      t.integer :prop_id
      t.integer :prop_val_yr
      t.integer :land_seg_id
      t.string :land_type_cd, limit: 10
      t.string :land_type_desc, limit: 25
      t.string :state_cd, limit: 5
      t.boolean :land_seg_homesite, null: false, default: false
      t.decimal :size_acres, precision: 14, scale: 4
      t.integer :size_square_feet
      t.integer :effective_front
      t.integer :effective_depth
      t.string :mkt_ls_method, limit: 5
      t.string :mkt_ls_class, limit: 10
      t.integer :land_seg_mkt_val
      t.boolean :ag_apply, null: false, default: false
      t.string :ag_ls_method, limit: 5
      t.string :ag_ls_class, limit: 10
      t.integer :ag_value
      t.decimal :land_homesite_pct, precision: 15, scale: 10

      t.timestamps
    end
  end
end
