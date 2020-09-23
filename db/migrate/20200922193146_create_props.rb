class CreateProps < ActiveRecord::Migration[6.0]
  def change
    create_table :props do |t|
      t.integer :prop_id
      t.string :prop_type_cd, limit: 5
      t.integer :prop_val_yr
      t.integer :sup_num
      t.string :sup_action, limit: 2
      t.string :sup_cd, limit: 10
      t.string :sup_desc, limit: 500
      t.string :geo_id, limit: 50
      t.integer :py_owner_id
      t.string :py_owner_name, limit: 70
      t.boolean :partial_owner, null: false, default: false
      t.integer :udi_group
      t.string :py_addr_line1, limit: 60
      t.string :py_addr_line2, limit: 60
      t.string :py_addr_line3, limit: 60
      t.string :py_addr_city, limit: 50
      t.string :py_addr_state, limit: 50
      t.string :py_addr_country, limit: 5
      t.string :py_addr_zip, limit: 5
      t.string :py_addr_zip_cass, limit: 4
      t.string :py_addr_zip_rt, limit: 2
      t.boolean :py_confidential_flag, null: false, default: false
      t.boolean :py_address_suppress_flag, null: false, default: false
      t.boolean :py_addr_ml_deliverable, null: false, default: false
      t.string :situs_street_prefx, limit: 10
      t.string :situs_street, limit: 50
      t.string :situs_street_suffix, limit: 10
      t.string :situs_city, limit: 30
      t.string :situs_zip, limit: 10
      t.string :legal_desc, limit: 255
      t.string :legal_desc2, limit: 255
      t.decimal :legal_acreage, precision: 16, scale: 4
      t.string :abs_subdv_cd, limit: 10
      t.string :hood_cd, limit: 10
      t.string :block, limit: 50
      t.string :tract_or_lot, limit: 50
      t.integer :land_hstd_val
      t.integer :land_non_hstd_val
      t.integer :imprv_hstd_val
      t.integer :imprv_non_hstd_val
      t.integer :ag_use_val
      t.integer :ag_market
      t.integer :timber_use
      t.integer :timber_market
      t.integer :appraised_val
      t.integer :ten_percent_cap
      t.integer :assessed_val
      t.boolean :arb_protest_flag, null: false, default: false
      t.string :deed_book_id, limit: 20
      t.string :deed_book_page, limit: 20
      t.string :deed_dt, limit: 25
      t.integer :mortgage_co_id
      t.string :mortage_co_name, limit: 70
      t.string :mortgage_acct_id, limit: 50
      t.integer :jan1_owner_id
      t.string :jan1_owner_name, limit: 70
      t.string :jan1_addr_line1, limit: 60
      t.string :jan1_addr_line2, limit: 60
      t.string :jan1_addr_line3, limit: 60
      t.string :jan1_addr_city, limit: 50
      t.string :jan1_addr_state, limit: 50
      t.string :jan1_addr_country, limit: 5
      t.string :jan1_addr_zip, limit: 5
      t.string :jan1_addr_zip_cass, limit: 4
      t.string :jan1_addr_zip_rt, limit: 2
      t.boolean :jan1_confidential_flag, null: false, default: false
      t.boolean :jan1_address_suppress_flag, null: false, default: false
      t.boolean :jan1_ml_deliverable, null: false, default: false
      t.boolean :hs_exempt, null: false, default: false
      t.boolean :ov65_exempt, null: false, default: false
      t.string :ov65_prorate_begin, limit: 25
      t.string :ov65_prorate_end, limit: 25
      t.boolean :ov65s_exempt, null: false, default: false
      t.boolean :dp_exempt, null: false, default: false
      t.boolean :dv1_exempt, null: false, default: false
      t.boolean :dv1s_exempt, null: false, default: false
      t.boolean :dv2_exempt, null: false, default: false
      t.boolean :dv2s_exempt, null: false, default: false
      t.boolean :dv3_exempt, null: false, default: false
      t.boolean :dv3s_exempt, null: false, default: false
      t.boolean :dv4_exempt, null: false, default: false
      t.boolean :dv4s_exempt, null: false, default: false
      t.boolean :ex_exempt, null: false, default: false
      t.string :ex_prorate_begin, limit: 25
      t.string :ex_prorate_end, limit: 25
      t.boolean :lve_exempt, null: false, default: false
      t.boolean :ab_exempt, null: false, default: false
      t.boolean :en_exempt, null: false, default: false
      t.boolean :fr_exempt, null: false, default: false
      t.boolean :ht_exempt, null: false, default: false
      t.boolean :pro_exempt, null: false, default: false
      t.boolean :pc_exempt, null: false, default: false
      t.boolean :so_exempt, null: false, default: false
      t.boolean :ex366_exempt, null: false, default: false
      t.boolean :ch_exempt, null: false, default: false
      t.string :imprv_state_cd, limit: 10
      t.string :land_state_cd, limit: 10
      t.string :personal_state_cd, limit: 10
      t.string :mineral_state_cd, limit: 10
      t.integer :land_acres
      t.integer :entity_agent_id
      t.string :entity_agent_name, limit: 70
      t.string :entity_agent_addr_line1, limit: 60
      t.string :entity_agent_addr_line2, limit: 60
      t.string :entity_agent_addr_line3, limit: 60
      t.string :entity_agent_city, limit: 50
      t.string :entity_agent_state, limit: 50
      t.string :entity_agent_country, limit: 5
      t.string :entity_agent_zip, limit: 5
      t.string :entity_agent_cass, limit: 4
      t.string :entity_agent_rt, limit: 2
      t.integer :ca_agent_id
      t.string :ca_agent_name, limit: 70
      t.string :ca_agent_addr_line1, limit: 60
      t.string :ca_agent_addr_line2, limit: 60
      t.string :ca_agent_addr_line3, limit: 60
      t.string :ca_agent_city, limit: 50
      t.string :ca_agent_state, limit: 50
      t.string :ca_agent_country, limit: 5
      t.string :ca_agent_zip, limit: 5
      t.string :ca_agent_zip_cass, limit: 4
      t.string :ca_agent_zip_rt, limit: 2
      t.integer :arb_agent_id
      t.string :arb_agent_name, limit: 70
      t.string :arb_agent_addr_line1, limit: 60
      t.string :arb_agent_addr_line2, limit: 60
      t.string :arb_agent_addr_line3, limit: 60
      t.string :arb_agent_city, limit: 50
      t.string :arb_agent_state, limit: 50
      t.string :arb_agent_country, limit: 5
      t.string :arb_agent_zip, limit: 5
      t.string :arb_agent_zip_cass, limit: 4
      t.string :arb_agent_zip_rt, limit: 2
      t.string :mineral_type_of_int, limit: 5
      t.decimal :mineral_int_pct, precision: 15, scale: 10
      t.string :productivity_use_code, limit: 3
      t.integer :timber_78_market
      t.integer :ag_late_loss
      t.integer :late_freeport_penalty
      t.string :dba, limit: 40
      t.integer :market_value
      t.date :ov65_deferral_date
      t.date :dp_deferral_date
      t.string :ref_id1, limit: 25
      t.string :ref_id2, limit: 25
      t.string :situs_num, limit: 15
      t.string :situs_unit, limit: 5
      t.integer :appr_owner_id
      t.string :appr_owner_name, limit: 70
      t.string :appr_addr_line1, limit: 60
      t.string :appr_addr_line2, limit: 60
      t.string :appr_addr_line3, limit: 60
      t.string :appr_addr_city, limit: 50
      t.string :appr_addr_state, limit: 50
      t.string :appr_addr_country, limit: 5
      t.string :appr_addr_zip, limit: 5
      t.string :appr_addr_zip_cass, limit: 4
      t.string :appr_addr_zip_cass_route, limit: 2
      t.boolean :appr_ml_deliverable, null: false, default: false
      t.boolean :appr_confidential_flag, null: false, default: false
      t.boolean :appr_address_suppress_flag, null: false, default: false
      t.string :appr_confidential_name, limit: 70
      t.string :py_confidential_name, limit: 70
      t.string :jan1_confidential_name, limit: 70
      t.boolean :rendition_filed, null: false, default: false
      t.date :rendition_date
      t.integer :rendition_penalty
      t.date :rendition_penalty_date_paid
      t.integer :rendition_fraud_penalty
      t.date :rendition_fraud_penalty_date_paid
      t.string :entities, limit: 140
      t.boolean :eco_exempt, null: false, default: false
      t.integer :dataset_id
      t.string :deed_num, limit: 50
      t.boolean :chodo_exempt, null: false, default: false
      t.boolean :local_option_pct_only_flag_hs, null: false, default: false
      t.boolean :local_option_pct_only_flag_ov65, null: false, default: false
      t.boolean :local_option_pct_only_flag_ov65s, null: false, default: false
      t.boolean :local_option_pct_only_flag_dp, null: false, default: false
      t.boolean :freeze_only_flag_ov65, null: false, default: false
      t.boolean :freeze_only_flag_ov65s, null: false, default: false
      t.boolean :freeze_only_flag_dp, null: false, default: false
      t.boolean :apply_percent_exemption_flag, null: false, default: false
      t.string :exemption_percentage, limit: 15
      t.boolean :vit_flag, null: false, default: false
      t.boolean :lih_exempt, null: false, default: false
      t.boolean :git_exempt, null: false, default: false
      t.boolean :dps_exempt, null: false, default: false
      t.date :dps_deferral_date
      t.boolean :local_option_pct_only_flag_dps, null: false, default: false
      t.boolean :freeze_only_flag_dps, null: false, default: false
      t.boolean :dvhs_exempt, null: false, default: false
      t.integer :hs_qualify_yr
      t.integer :ov65_qualify_yr
      t.integer :ov65s_qualify_yr
      t.integer :dp_qualify_yr
      t.integer :dps_qualify_yr
      t.integer :dv1_qualify_yr
      t.integer :dv1s_qualify_yr
      t.integer :dv2_qualify_yr
      t.integer :dv2s_qualify_yr
      t.integer :dv3_qualify_yr
      t.integer :dv3s_qualify_yr
      t.integer :dv4_qualify_yr
      t.integer :dv4s_qualify_yr
      t.integer :dvhs_qualify_yr
      t.integer :ex_qualify_yr
      t.integer :ab_qualify_yr
      t.integer :en_qualify_yr
      t.integer :fr_qualify_yr
      t.integer :ht_qualify_yr
      t.integer :pro_qualify_yr
      t.integer :pc_qualify_yr
      t.integer :so_qualify_yr
      t.integer :ex366_qualify_yr
      t.integer :ch_qualify_yr
      t.integer :eco_qualify_yr
      t.integer :chodo_qualify_yr
      t.integer :lih_qualify_yr
      t.integer :git_qualify_yr
      t.string :mortgage_addr_line1, limit: 60
      t.string :mortgage_addr_line2, limit: 60
      t.string :mortgage_addr_line3, limit: 60
      t.string :mortgage_addr_city, limit: 50
      t.string :mortgage_addr_state, limit: 50
      t.string :mortgage_addr_country, limit: 5
      t.string :mortgage_addr_zip, limit: 5
      t.string :mortgage_addr_zip_cass, limit: 4
      t.string :mortgage_addr_zip_rt, limit: 2
      t.boolean :mortgage_addr_ml_deliverable, null: false, default: false
      t.string :sic_code, limit: 10
      t.boolean :omitted_property_flag, null: false, default: false
      t.string :hs_prorate_begin, limit: 25
      t.string :hs_prorate_end, limit: 25
      t.string :ov65s_prorate_begin, limit: 25
      t.string :ov65s_prorate_end, limit: 25
      t.string :dp_prorate_begin, limit: 25
      t.string :dp_prorate_end, limit: 25
      t.string :dv1_prorate_begin, limit: 25
      t.string :dv1_prorate_end, limit: 25
      t.string :dv1s_prorate_begin, limit: 25
      t.string :dv1s_prorate_end, limit: 25
      t.string :dv2_prorate_begin, limit: 25
      t.string :dv2_prorate_end, limit: 25
      t.string :dv2s_prorate_begin, limit: 25
      t.string :dv2s_prorate_end, limit: 25
      t.string :dv3_prorate_begin, limit: 25
      t.string :dv3_prorate_end, limit: 25
      t.string :dv3s_prorate_begin, limit: 25
      t.string :dv3s_prorate_end, limit: 25
      t.string :dv4_prorate_begin, limit: 25
      t.string :dv4_prorate_end, limit: 25
      t.string :dv4s_prorate_begin, limit: 25
      t.string :dv4s_prorate_end, limit: 25
      t.string :lve_prorate_begin, limit: 25
      t.string :lve_prorate_end, limit: 25
      t.string :ab_prorate_begin, limit: 25
      t.string :ab_prorate_end, limit: 25
      t.string :en_prorate_begin, limit: 25
      t.string :en_prorate_end, limit: 25
      t.string :fr_prorate_begin, limit: 25
      t.string :fr_prorate_end, limit: 25
      t.string :ht_prorate_begin, limit: 25
      t.string :ht_prorate_end, limit: 25
      t.string :pro_prorate_begin, limit: 25
      t.string :pro_prorate_end, limit: 25
      t.string :pc_prorate_begin, limit: 25
      t.string :pc_prorate_end, limit: 25
      t.string :so_prorate_begin, limit: 25
      t.string :so_prorate_end, limit: 25
      t.string :ex366_prorate_begin, limit: 25
      t.string :ex366_prorate_end, limit: 25
      t.string :ch_prorate_begin, limit: 25
      t.string :ch_prorate_end, limit: 25
      t.string :dps_prorate_begin, limit: 25
      t.string :dps_prorate_end, limit: 25
      t.string :eco_prorate_begin, limit: 25
      t.string :eco_prorate_end, limit: 25
      t.string :chodo_prorate_begin, limit: 25
      t.string :chodo_prorate_end, limit: 25
      t.string :lih_prorate_begin, limit: 25
      t.string :lih_prorate_end, limit: 25
      t.string :git_prorate_begin, limit: 25
      t.string :git_prorate_end, limit: 25
      t.boolean :clt_exempt, null: false, default: false
      t.string :clt_prorate_begin, limit: 25
      t.string :clt_prorate_end, limit: 25
      t.integer :clt_qualify_yr
      t.boolean :dvhss_exempt, null: false, default: false
      t.string :dvhss_prorate_begin, limit: 25
      t.string :dvhss_prorate_end, limit: 25
      t.integer :dvhss_qualify_yr
      t.integer :omitted_imprv_hstd_val
      t.integer :omitted_imprv_non_hstd_val
      t.string :dvhs_prorate_begin, limit: 25
      t.string :dvhs_prorate_end, limit: 25
      t.boolean :ex_xd_exempt, null: false, default: false
      t.integer :ex_xd_qualify_yr
      t.string :ex_xd_prorate_begin, limit: 25
      t.string :ex_xd_prorate_end, limit: 25
      t.boolean :ex_xf_exempt, null: false, default: false
      t.integer :ex_xf_qualify_yr
      t.string :ex_xf_prorate_begin, limit: 25
      t.string :ex_xf_prorate_end, limit: 25
      t.boolean :ex_xg_exempt, null: false, default: false
      t.integer :ex_xg_qualify_yr
      t.string :ex_xg_prorate_begin, limit: 25
      t.string :ex_xg_prorate_end, limit: 25
      t.boolean :ex_xh_exempt, null: false, default: false
      t.integer :ex_xh_qualify_yr
      t.string :ex_xh_prorate_begin, limit: 25
      t.string :ex_xh_prorate_end, limit: 25
      t.boolean :ex_xi_exempt, null: false, default: false
      t.integer :ex_xi_qualify_yr
      t.string :ex_xi_prorate_begin, limit: 25
      t.string :ex_xi_prorate_end, limit: 25
      t.boolean :ex_xj_exempt, null: false, default: false
      t.integer :ex_xj_qualify_yr
      t.string :ex_xj_prorate_begin, limit: 25
      t.string :ex_xj_prorate_end, limit: 25
      t.boolean :ex_xl_exempt, null: false, default: false
      t.integer :ex_xl_qualify_yr
      t.string :ex_xl_prorate_begin, limit: 25
      t.string :ex_xl_prorate_end, limit: 25
      t.boolean :ex_xm_exempt, null: false, default: false
      t.integer :ex_xm_qualify_yr
      t.string :ex_xm_prorate_begin, limit: 25
      t.string :ex_xm_prorate_end, limit: 25
      t.boolean :ex_xn_exempt, null: false, default: false
      t.integer :ex_xn_qualify_yr
      t.string :ex_xn_prorate_begin, limit: 25
      t.string :ex_xn_prorate_end, limit: 25
      t.boolean :ex_xo_exempt, null: false, default: false
      t.integer :ex_xo_qualify_yr
      t.string :ex_xo_prorate_begin, limit: 25
      t.string :ex_xo_prorate_end, limit: 25
      t.boolean :ex_xp_exempt, null: false, default: false
      t.integer :ex_xp_qualify_yr
      t.string :ex_xp_prorate_begin, limit: 25
      t.string :ex_xp_prorate_end, limit: 25
      t.boolean :ex_xq_exempt, null: false, default: false
      t.integer :ex_xq_qualify_yr
      t.string :ex_xq_prorate_begin, limit: 25
      t.string :ex_xq_prorate_end, limit: 25
      t.boolean :ex_xr_exempt, null: false, default: false
      t.integer :ex_xr_qualify_yr
      t.string :ex_xr_prorate_begin, limit: 25
      t.string :ex_xr_prorate_end, limit: 25
      t.boolean :ex_xs_exempt, null: false, default: false
      t.integer :ex_xs_qualify_yr
      t.string :ex_xs_prorate_begin, limit: 25
      t.string :ex_xs_prorate_end, limit: 25
      t.boolean :ex_xt_exempt, null: false, default: false
      t.integer :ex_xt_qualify_yr
      t.string :ex_xt_prorate_begin, limit: 25
      t.string :ex_xt_prorate_end, limit: 25
      t.boolean :ex_xu_exempt, null: false, default: false
      t.integer :ex_xu_qualify_yr
      t.string :ex_xu_prorate_begin, limit: 25
      t.string :ex_xu_prorate_end, limit: 25
      t.boolean :ex_xv_exempt, null: false, default: false
      t.integer :ex_xv_qualify_yr
      t.string :ex_xv_prorate_begin, limit: 25
      t.string :ex_xv_prorate_end, limit: 25
      t.boolean :ex_xa_exempt, null: false, default: false
      t.integer :ex_xa_qualify_yr
      t.string :ex_xa_prorate_begin, limit: 25
      t.string :ex_xa_prorate_end, limit: 25
      t.integer :lve_qualify_yr
      t.boolean :ppv_exempt, null: false, default: false
      t.integer :ppv_qualify_yr
      t.string :ppv_prorate_begin, limit: 25
      t.string :ppv_prorate_end, limit: 25
      t.boolean :dvch_exempt, null: false, default: false
      t.integer :dvch_qualify_yr
      t.string :dvch_prorate_begin, limit: 25
      t.string :dvch_prorate_end, limit: 25
      t.boolean :dvchs_exempt, null: false, default: false
      t.integer :dvchs_qualify_yr
      t.string :dvchs_prorate_begin, limit: 25
      t.string :dvchs_prorate_end, limit: 25
      t.boolean :masss_exempt, null: false, default: false
      t.integer :masss_qualify_yr
      t.string :masss_prorate_begin, limit: 25
      t.string :masss_prorate_end, limit: 25
      t.integer :pp_late_interstate_allocation_val
      t.integer :appraised_val_reflecting_productivity_loss
      t.integer :assessed_val_reflecting_productivity_loss
      t.boolean :frss_exempt, null: false, default: false
      t.integer :frss_qualify_yr
      t.string :frss_prorate_begin, limit: 25
      t.string :frss_prorate_end, limit: 25
      t.boolean :abmno_exempt, null: false, default: false
      t.integer :abmno_qualify_yr
      t.string :abmno_prorate_begin, limit: 25
      t.string :abmno_prorate_end, limit: 25
      t.date :dv1_deferral_date
      t.date :dv2_deferral_date
      t.date :dv3_deferral_date
      t.date :dv4_deferral_date
      t.date :dv1s_deferral_date
      t.date :dv2s_deferral_date
      t.date :dv3s_deferral_date
      t.date :dv4s_deferral_date
      t.boolean :dis_exempt, null: false, default: false
      t.integer :dis_qualify_yr
      t.string :dis_prorate_begin, limit: 25
      t.string :dis_prorate_end, limit: 25

      t.timestamps
    end
  end
end
