class CreatePropEnts < ActiveRecord::Migration[6.0]
  def change
    create_table :prop_ents do |t|
      t.integer :prop_id
      t.integer :prop_val_yr
      t.integer :sup_num
      t.integer :owner_id
      t.integer :entity_id
      t.string :entity_cd, limit: 10
      t.string :entity_name, limit: 50
      t.string :entity_xref_id, limit: 20
      t.integer :assessed_val
      t.integer :taxable_val
      t.integer :ab_amt
      t.integer :en_amt
      t.integer :fr_amt
      t.integer :ht_amt
      t.integer :pro_amt
      t.integer :pc_amt
      t.integer :so_amt
      t.integer :ex366_amt
      t.integer :hs_amt
      t.integer :ov65_amt
      t.integer :dp_amt
      t.integer :dv_amt
      t.integer :ex_amt
      t.integer :ch_amt
      t.integer :market_value
      t.integer :appraised_value
      t.integer :hs_cap
      t.integer :ag_late_loss
      t.integer :freeport_late_loss
      t.integer :hs_state_amt
      t.integer :hs_local_amt
      t.integer :land_hstd_val
      t.integer :land_non_hstd_val
      t.integer :imprv_hstd_val
      t.integer :imprv_non_hstd_val
      t.integer :ag_use_val
      t.integer :ag_market_val
      t.integer :tim_use_val
      t.integer :tim_market_val
      t.boolean :partial_entity, null: false, default: false
      t.integer :freeze_yr
      t.integer :freeze_ceiling
      t.boolean :freeze_transfer_flag, null: false, default: false
      t.date :freeze_transfer_date
      t.integer :freeze_previous_tax
      t.integer :freeze_previous_tax_unfrozen
      t.decimal :freeze_transfer_percentage, precision: 9, scale: 6
      t.integer :lve_amt
      t.integer :eco_amt
      t.integer :ag_use_val_ne
      t.integer :ag_use_val_ex
      t.integer :ag_market_ne
      t.integer :ag_market_ex
      t.integer :timber_use_ne
      t.integer :timber_use_ex
      t.integer :timber_market_ne
      t.integer :timber_market_ex
      t.integer :new_val_hs
      t.integer :new_val_nhs
      t.integer :new_val_p
      t.integer :new_val_taxable
      t.integer :dataset_id
      t.integer :chodo_amt
      t.decimal :ent_pct_land_hs, precision: 15, scale: 10
      t.decimal :ent_pct_land_nonhs, precision: 15, scale: 10
      t.decimal :ent_pct_imprv_hs, precision: 15, scale: 10
      t.decimal :ent_pct_imprv_nonhs, precision: 15, scale: 10
      t.decimal :ent_pct_ag_use, precision: 15, scale: 10
      t.decimal :ent_pct_ag_mkt, precision: 15, scale: 10
      t.decimal :ent_pct_tim_use, precision: 15, scale: 10
      t.decimal :ent_pct_tim_mkt, precision: 15, scale: 10
      t.decimal :ent_pct_pers, precision: 15, scale: 10
      t.decimal :ent_pct_min, precision: 15, scale: 10
      t.decimal :ent_pct_auto, precision: 15, scale: 10
      t.integer :lih_amt
      t.integer :git_amt
      t.integer :dvhs_amt
      t.boolean :tax_increment_flag, null: false, default: false
      t.integer :tax_increment_imprv_val
      t.integer :tax_increment_land_val
      t.decimal :weed_taxable_acres, precision: 15, scale: 4
      t.decimal :hs_allocation_factor, precision: 15, scale: 10
      t.decimal :ov65_allocation_factor, precision: 15, scale: 10
      t.decimal :ov65s_allocation_factor, precision: 15, scale: 10
      t.decimal :dp_allocation_factor, precision: 15, scale: 10
      t.decimal :dps_allocation_factor, precision: 15, scale: 10
      t.decimal :dv1_allocation_factor, precision: 15, scale: 10
      t.decimal :dv1s_allocation_factor, precision: 15, scale: 10
      t.decimal :dv2_allocation_factor, precision: 15, scale: 10
      t.decimal :dv2s_allocation_factor, precision: 15, scale: 10
      t.decimal :dv3_allocation_factor, precision: 15, scale: 10
      t.decimal :dv3s_allocation_factor, precision: 15, scale: 10
      t.decimal :dv4_allocation_factor, precision: 15, scale: 10
      t.decimal :dv4s_allocation_factor, precision: 15, scale: 10
      t.decimal :dvhs_allocation_factor, precision: 15, scale: 10
      t.decimal :ex_allocation_factor, precision: 15, scale: 10
      t.decimal :ab_allocation_factor, precision: 15, scale: 10
      t.decimal :en_allocation_factor, precision: 15, scale: 10
      t.decimal :fr_allocation_factor, precision: 15, scale: 10
      t.decimal :ht_allocation_factor, precision: 15, scale: 10
      t.decimal :pro_allocation_factor, precision: 15, scale: 10
      t.decimal :pc_allocation_factor, precision: 15, scale: 10
      t.decimal :so_allocation_factor, precision: 15, scale: 10
      t.decimal :ex366_allocation_factor, precision: 15, scale: 10
      t.decimal :ch_allocation_factor, precision: 15, scale: 10
      t.decimal :eco_allocation_factor, precision: 15, scale: 10
      t.decimal :chodo_allocation_factor, precision: 15, scale: 10
      t.decimal :lih_allocation_factor, precision: 15, scale: 10
      t.decimal :git_allocation_factor, precision: 15, scale: 10
      t.string :freeze_exmpt_type_cd, limit: 5
      t.string :freeze_transfer_exmpt_type_cd, limit: 5
      t.string :tax_increment_zone_cd, limit: 10
      t.string :tax_increment_zone_desc, limit: 50
      t.integer :omitted_imprv_hstd_val
      t.integer :omitted_imprv_non_hstd_val
      t.integer :clt_amt
      t.decimal :clt_allocation_factor, precision: 15, scale: 10
      t.integer :dvhss_amt
      t.decimal :dvhss_allocation_factor, precision: 15, scale: 10
      t.decimal :homestead_group_exemption_factor, precision: 15, scale: 10
      t.integer :ex_xd_amt
      t.decimal :ex_xd_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xf_amt
      t.decimal :ex_xf_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xg_amt
      t.decimal :ex_xg_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xh_amt
      t.decimal :ex_xh_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xi_amt
      t.decimal :ex_xi_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xj_amt
      t.decimal :ex_xj_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xl_amt
      t.decimal :ex_xl_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xm_amt
      t.decimal :ex_xm_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xn_amt
      t.decimal :ex_xn_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xo_amt
      t.decimal :ex_xo_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xp_amt
      t.decimal :ex_xp_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xq_amt
      t.decimal :ex_xq_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xr_amt
      t.decimal :ex_xr_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xs_amt
      t.decimal :ex_xs_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xt_amt
      t.decimal :ex_xt_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xu_amt
      t.decimal :ex_xu_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xv_amt
      t.decimal :ex_xv_allocation_factor, precision: 15, scale: 10
      t.integer :ex_xa_amt
      t.decimal :ex_xa_allocation_factor, precision: 15, scale: 10
      t.decimal :lve_allocation_factor, precision: 15, scale: 10
      t.integer :ppv_amt
      t.decimal :ppv_allocation_factor, precision: 15, scale: 10
      t.integer :dvch_amt
      t.decimal :dvch_allocation_factor, precision: 15, scale: 10
      t.integer :dvchs_amt
      t.decimal :dvchs_allocation_factor, precision: 15, scale: 10
      t.integer :masss_amt
      t.decimal :masss_allocation_factor, precision: 15, scale: 10
      t.integer :pp_late_interstate_allocation_val
      t.integer :frss_amt
      t.decimal :frss_allocation_factor, precision: 15, scale: 10
      t.integer :abmno_amt
      t.decimal :abmno_allocation_factor, precision: 15, scale: 10
      t.integer :dis_amt
      t.decimal :dis_allocation_factor, precision: 15, scale: 10

      t.timestamps
    end
  end
end
