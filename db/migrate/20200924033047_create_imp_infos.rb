class CreateImpInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :imp_infos do |t|
      t.integer :prop_id, comment: "Property ID"
      t.integer :prop_val_yr, comment: "Year"
      t.integer :imprv_id, comment: "Improvement ID"
      t.string :imprv_type_cd, limit: 10, comment: "Improvement Type"
      t.string :imprv_type_desc, limit: 25, comment: "Improvement Description"
      t.string :imprv_state_cd, limit: 5, comment: "State Code"
      t.boolean :imprv_homesite, null: false, default: false, comment: "Y indicates Homesite improvement, N non Homesite"
      t.integer :imprv_val, comment: "Improvement Value"
      t.decimal :imprv_homesite_pct, precision: 15, scale: 10, comment: "Homesite Apportionment Percentage"
      t.boolean :omitted, null: false, default: false, comment: "Omitted Improvement (Y or N)"
      t.integer :omitted_imprv_val, comment: "Omitted Value"

      t.timestamps
    end
  end
end
