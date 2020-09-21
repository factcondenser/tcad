class CreateImpInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :imp_infos do |t|
      t.integer :prop_id
      t.integer :prop_val_yr
      t.integer :imprv_id
      t.string :imprv_type_cd, limit: 10
      t.string :imprv_type_desc, limit: 25
      t.string :imprv_state_cd, limit: 5
      t.string :imprv_homesite, limit: 1
      t.integer :imprv_val
      t.integer :imprv_homesite_pct
      t.string :omitted, limit: 1
      t.integer :omitted_imprv_val

      t.timestamps
    end
  end
end
