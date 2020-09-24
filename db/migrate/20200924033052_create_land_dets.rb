class CreateLandDets < ActiveRecord::Migration[6.0]
  def change
    create_table :land_dets do |t|
      t.integer :prop_id, comment: "Property ID"
      t.integer :prop_val_yr, comment: "Year"
      t.integer :land_seg_id, comment: "Unique Identifier"
      t.string :land_type_cd, limit: 10, comment: "Land Type Code"
      t.string :land_type_desc, limit: 25, comment: "Land Type Description"
      t.string :state_cd, limit: 5, comment: "State Code"
      t.boolean :land_seg_homesite, null: false, default: false, comment: "T indicates Homesite improvement, F non Homesite"
      t.decimal :size_acres, precision: 14, scale: 4, comment: "Size Acres ( 4 Decimals )"
      t.integer :size_square_feet, comment: "Size Square Feet"
      t.integer :effective_front, comment: "Effective Front"
      t.integer :effective_depth, comment: "Effective Depth"
      t.string :mkt_ls_method, limit: 5, comment: "Market Method"
      t.string :mkt_ls_class, limit: 10, comment: "Market Class"
      t.integer :land_seg_mkt_val, comment: "Market Value"
      t.boolean :ag_apply, null: false, default: false, comment: "T indicates property has ag, F no ag"
      t.string :ag_ls_method, limit: 5, comment: "Ag Method"
      t.string :ag_ls_class, limit: 10, comment: "Ag Class"
      t.integer :ag_value, comment: "Ag Value"
      t.decimal :land_homesite_pct, precision: 15, scale: 10, comment: "Homesite Apportionment Percentage"

      t.timestamps
    end
  end
end
