# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_20_231950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abs_subds", force: :cascade do |t|
    t.string "abs_subdv_cd", limit: 10
    t.string "abs_subdv_desc", limit: 40
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appr_hdrs", force: :cascade do |t|
    t.date "run_date"
    t.string "file_escription", limit: 40
    t.integer "appraisal_year"
    t.integer "supplement_number"
    t.string "entity_code", limit: 10
    t.string "entity_escription", limit: 40
    t.string "office_name", limit: 30
    t.string "operator", limit: 20
    t.string "pacs_version", limit: 10
    t.string "export_version", limit: 10
    t.string "value_option", limit: 10
    t.string "office_use_only", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "arbitrations", force: :cascade do |t|
    t.integer "prop_id"
    t.integer "prop_val_yr"
    t.string "geo_id", limit: 50
    t.string "ref_id1", limit: 25
    t.string "ref_id2", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "arbs", force: :cascade do |t|
    t.integer "prop_id"
    t.integer "prop_val_yr"
    t.string "geo_id", limit: 50
    t.string "ref_id1", limit: 25
    t.string "ref_id2", limit: 25
    t.string "ARB_Status", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_cd", limit: 5
    t.string "country_name", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entities", force: :cascade do |t|
    t.integer "entity_id"
    t.string "entity_cd", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "imp_dets", force: :cascade do |t|
    t.integer "prop_id"
    t.integer "prop_val_yr"
    t.integer "imprv_id"
    t.integer "imprv_det_id"
    t.string "Imprv_det_type_cd", limit: 10
    t.string "Imprv_det_type_desc", limit: 25
    t.string "Imprv_det_class_cd", limit: 10
    t.integer "yr_built"
    t.integer "depreciation_yr"
    t.integer "imprv_det_area"
    t.integer "imprv_det_val"
    t.string "sketch_cmds", limit: 500
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "imp_infos", force: :cascade do |t|
    t.integer "prop_id"
    t.integer "prop_val_yr"
    t.integer "imprv_id"
    t.string "imprv_type_cd", limit: 10
    t.string "imprv_type_desc", limit: 25
    t.string "imprv_state_cd", limit: 5
    t.string "imprv_homesite", limit: 1
    t.integer "imprv_val"
    t.integer "imprv_homesite_pct"
    t.string "omitted", limit: 1
    t.integer "omitted_imprv_val"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "land_dets", force: :cascade do |t|
    t.integer "prop_id"
    t.integer "prop_val_yr"
    t.integer "land_seg_id"
    t.string "land_type_cd", limit: 10
    t.string "land_type_desc", limit: 25
    t.string "state_cd", limit: 5
    t.string "land_seg_homesite", limit: 1
    t.integer "size_acres"
    t.integer "size_square_feet"
    t.integer "effective_front"
    t.integer "effective_depth"
    t.string "mkt_ls_method", limit: 5
    t.string "mkt_ls_class", limit: 10
    t.integer "land_seg_mkt_val"
    t.string "ag_apply", limit: 1
    t.string "ag_ls_method", limit: 5
    t.string "ag_ls_class", limit: 10
    t.integer "ag_value"
    t.integer "land_homesite_pct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lawsuits", force: :cascade do |t|
    t.integer "prop_id"
    t.integer "prop_val_yr"
    t.string "geo_id", limit: 50
    t.string "ref_id1", limit: 25
    t.string "ref_id2", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prop_ents", force: :cascade do |t|
    t.integer "prop_id"
    t.integer "prop_val_yr"
    t.integer "sup_num"
    t.integer "owner_id"
    t.integer "entity_id"
    t.string "entity_cd", limit: 10
    t.string "entity_name", limit: 50
    t.string "entity_xref_id", limit: 20
    t.integer "assessed_val"
    t.integer "taxable_val"
    t.integer "ab_amt"
    t.integer "en_amt"
    t.integer "fr_amt"
    t.integer "ht_amt"
    t.integer "pro_amt"
    t.integer "pc_amt"
    t.integer "so_amt"
    t.integer "ex366_amt"
    t.integer "hs_amt"
    t.integer "ov65_amt"
    t.integer "dp_amt"
    t.integer "dv_amt"
    t.integer "ex_amt"
    t.integer "ch_amt"
    t.integer "market_value"
    t.integer "appraised_value"
    t.integer "hs_cap"
    t.integer "ag_late_loss"
    t.integer "freeport_late_loss"
    t.integer "hs_state_amt"
    t.integer "hs_local_amt"
    t.integer "land_hstd_val"
    t.integer "land_non_hstd_val"
    t.integer "imprv_hstd_val"
    t.integer "imprv_non_hstd_val"
    t.integer "ag_use_val"
    t.integer "ag_market_val"
    t.integer "tim_use_val"
    t.integer "tim_market_val"
    t.string "partial_entity", limit: 1
    t.integer "freeze_yr"
    t.integer "freeze_ceiling"
    t.string "freeze_transfer_flag", limit: 1
    t.date "freeze_transfer_date"
    t.integer "freeze_previous_tax"
    t.integer "freeze_previous_tax_unfrozen"
    t.integer "freeze_transfer_percentage"
    t.integer "lve_amt"
    t.integer "eco_amt"
    t.integer "ag_use_val_ne"
    t.integer "ag_use_val_ex"
    t.integer "ag_market_ne"
    t.integer "ag_market_ex"
    t.integer "timber_use_ne"
    t.integer "timber_use_ex"
    t.integer "timber_market_ne"
    t.integer "timber_market_ex"
    t.integer "new_val_hs"
    t.integer "new_val_nhs"
    t.integer "new_val_p"
    t.integer "new_val_taxable"
    t.integer "dataset_id"
    t.integer "chodo_amt"
    t.integer "ent_pct_land_hs"
    t.integer "ent_pct_land_nonhs"
    t.integer "ent_pct_imprv_hs"
    t.integer "ent_pct_imprv_nonhs"
    t.integer "ent_pct_ag_use"
    t.integer "ent_pct_ag_mkt"
    t.integer "ent_pct_tim_use"
    t.integer "ent_pct_tim_mkt"
    t.integer "ent_pct_pers"
    t.integer "ent_pct_min"
    t.integer "ent_pct_auto"
    t.integer "lih_amt"
    t.integer "git_amt"
    t.integer "dvhs_amt"
    t.string "tax_increment_flag", limit: 1
    t.integer "tax_increment_imprv_val"
    t.integer "tax_increment_land_val"
    t.integer "weed_taxable_acres"
    t.integer "hs_allocation_factor"
    t.integer "ov65_allocation_factor"
    t.integer "ov65s_allocation_factor"
    t.integer "dp_allocation_factor"
    t.integer "dps_allocation_factor"
    t.integer "dv1_allocation_factor"
    t.integer "dv1s_allocation_factor"
    t.integer "dv2_allocation_factor"
    t.integer "dv2s_allocation_factor"
    t.integer "dv3_allocation_factor"
    t.integer "dv3s_allocation_factor"
    t.integer "dv4_allocation_factor"
    t.integer "dv4s_allocation_factor"
    t.integer "dvhs_allocation_factor"
    t.integer "ex_allocation_factor"
    t.integer "ab_allocation_factor"
    t.integer "en_allocation_factor"
    t.integer "fr_allocation_factor"
    t.integer "ht_allocation_factor"
    t.integer "pro_allocation_factor"
    t.integer "pc_allocation_factor"
    t.integer "so_allocation_factor"
    t.integer "ex366_allocation_factor"
    t.integer "ch_allocation_factor"
    t.integer "eco_allocation_factor"
    t.integer "chodo_allocation_factor"
    t.integer "lih_allocation_factor"
    t.integer "git_allocation_factor"
    t.string "freeze_exmpt_type_cd", limit: 5
    t.string "freeze_transfer_exmpt_type_cd", limit: 5
    t.string "tax_increment_zone_cd", limit: 10
    t.string "tax_increment_zone_desc", limit: 50
    t.integer "omitted_imprv_hstd_val"
    t.integer "omitted_imprv_non_hstd_val"
    t.integer "clt_amt"
    t.integer "clt_allocation_factor"
    t.integer "dvhss_amt"
    t.integer "dvhss_allocation_factor"
    t.integer "homestead_group_exemption_factor"
    t.integer "ex_xd_amt"
    t.integer "ex_xd_allocation_factor"
    t.integer "ex_xf_amt"
    t.integer "ex_xf_allocation_factor"
    t.integer "ex_xg_amt"
    t.integer "ex_xg_allocation_factor"
    t.integer "ex_xh_amt"
    t.integer "ex_xh_allocation_factor"
    t.integer "ex_xi_amt"
    t.integer "ex_xi_allocation_factor"
    t.integer "ex_xj_amt"
    t.integer "ex_xj_allocation_factor"
    t.integer "ex_xl_amt"
    t.integer "ex_xl_allocation_factor"
    t.integer "ex_xm_amt"
    t.integer "ex_xm_allocation_factor"
    t.integer "ex_xn_amt"
    t.integer "ex_xn_allocation_factor"
    t.integer "ex_xo_amt"
    t.integer "ex_xo_allocation_factor"
    t.integer "ex_xp_amt"
    t.integer "ex_xp_allocation_factor"
    t.integer "ex_xq_amt"
    t.integer "ex_xq_allocation_factor"
    t.integer "ex_xr_amt"
    t.integer "ex_xr_allocation_factor"
    t.integer "ex_xs_amt"
    t.integer "ex_xs_allocation_factor"
    t.integer "ex_xt_amt"
    t.integer "ex_xt_allocation_factor"
    t.integer "ex_xu_amt"
    t.integer "ex_xu_allocation_factor"
    t.integer "ex_xv_amt"
    t.integer "ex_xv_allocation_factor"
    t.integer "ex_xa_amt"
    t.integer "ex_xa_allocation_factor"
    t.integer "lve_allocation_factor"
    t.integer "ppv_amt"
    t.integer "ppv_allocation_factor"
    t.integer "dvch_amt"
    t.integer "dvch_allocation_factor"
    t.integer "dvchs_amt"
    t.integer "dvchs_allocation_factor"
    t.integer "masss_amt"
    t.integer "masss_allocation_factor"
    t.integer "pp_late_interstate_allocation_val"
    t.integer "frss_amt"
    t.integer "frss_allocation_factor"
    t.integer "abmno_amt"
    t.integer "abmno_allocation_factor"
    t.integer "dis_amt"
    t.integer "dis_allocation_factor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "props", force: :cascade do |t|
    t.integer "prop_id"
    t.string "prop_type_cd", limit: 5
    t.integer "prop_val_yr"
    t.integer "sup_num"
    t.string "sup_action", limit: 2
    t.string "sup_cd", limit: 10
    t.string "sup_desc", limit: 500
    t.string "geo_id", limit: 50
    t.integer "py_owner_id"
    t.string "py_owner_name", limit: 70
    t.string "partial_owner", limit: 1
    t.integer "udi_group"
    t.string "py_addr_line1", limit: 60
    t.string "py_addr_line2", limit: 60
    t.string "py_addr_line3", limit: 60
    t.string "py_addr_city", limit: 50
    t.string "py_addr_state", limit: 50
    t.string "py_addr_country", limit: 5
    t.string "py_addr_zip", limit: 5
    t.string "py_addr_zip_cass", limit: 4
    t.string "py_addr_zip_rt", limit: 2
    t.string "py_confidential_flag", limit: 1
    t.string "py_address_suppress_flag", limit: 1
    t.string "py_addr_ml_deliverable", limit: 1
    t.string "situs_street_prefx", limit: 10
    t.string "situs_street", limit: 50
    t.string "situs_street_suffix", limit: 10
    t.string "situs_city", limit: 30
    t.string "situs_zip", limit: 10
    t.string "legal_desc", limit: 255
    t.string "legal_desc2", limit: 255
    t.integer "legal_acreage"
    t.string "abs_subdv_cd", limit: 10
    t.string "hood_cd", limit: 10
    t.string "block", limit: 50
    t.string "tract_or_lot", limit: 50
    t.integer "land_hstd_val"
    t.integer "land_non_hstd_val"
    t.integer "imprv_hstd_val"
    t.integer "imprv_non_hstd_val"
    t.integer "ag_use_val"
    t.integer "ag_market"
    t.integer "timber_use"
    t.integer "timber_market"
    t.integer "appraised_val"
    t.integer "ten_percent_cap"
    t.integer "assessed_val"
    t.string "arb_protest_flag", limit: 1
    t.string "deed_book_id", limit: 20
    t.string "deed_book_page", limit: 20
    t.string "deed_dt", limit: 25
    t.integer "mortgage_co_id"
    t.string "mortage_co_name", limit: 70
    t.string "mortgage_acct_id", limit: 50
    t.integer "jan1_owner_id"
    t.string "jan1_owner_name", limit: 70
    t.string "jan1_addr_line1", limit: 60
    t.string "jan1_addr_line2", limit: 60
    t.string "jan1_addr_line3", limit: 60
    t.string "jan1_addr_city", limit: 50
    t.string "jan1_addr_state", limit: 50
    t.string "jan1_addr_country", limit: 5
    t.string "jan1_addr_zip", limit: 5
    t.string "jan1_addr_zip_cass", limit: 4
    t.string "jan1_addr_zip_rt", limit: 2
    t.string "jan1_confidential_flag", limit: 1
    t.string "jan1_address_suppress_flag", limit: 1
    t.string "jan1_ml_deliverable", limit: 1
    t.string "hs_exempt", limit: 1
    t.string "ov65_exempt", limit: 1
    t.string "ov65_prorate_begin", limit: 25
    t.string "ov65_prorate_end", limit: 25
    t.string "ov65s_exempt", limit: 1
    t.string "dp_exempt", limit: 1
    t.string "dv1_exempt", limit: 1
    t.string "dv1s_exempt", limit: 1
    t.string "dv2_exempt", limit: 1
    t.string "dv2s_exempt", limit: 1
    t.string "dv3_exempt", limit: 1
    t.string "dv3s_exempt", limit: 1
    t.string "dv4_exempt", limit: 1
    t.string "dv4s_exempt", limit: 1
    t.string "ex_exempt", limit: 1
    t.string "ex_prorate_begin", limit: 25
    t.string "ex_prorate_end", limit: 25
    t.string "lve_exempt", limit: 1
    t.string "ab_exempt", limit: 1
    t.string "en_exempt", limit: 1
    t.string "fr_exempt", limit: 1
    t.string "ht_exempt", limit: 1
    t.string "pro_exempt", limit: 1
    t.string "pc_exempt", limit: 1
    t.string "so_exempt", limit: 1
    t.string "ex366_exempt", limit: 1
    t.string "ch_exempt", limit: 1
    t.string "imprv_state_cd", limit: 10
    t.string "land_state_cd", limit: 10
    t.string "personal_state_cd", limit: 10
    t.string "mineral_state_cd", limit: 10
    t.integer "land_acres"
    t.integer "entity_agent_id"
    t.string "entity_agent_name", limit: 70
    t.string "entity_agent_addr_line1", limit: 60
    t.string "entity_agent_addr_line2", limit: 60
    t.string "entity_agent_addr_line3", limit: 60
    t.string "entity_agent_city", limit: 50
    t.string "entity_agent_state", limit: 50
    t.string "entity_agent_country", limit: 5
    t.string "entity_agent_zip", limit: 5
    t.string "entity_agent_cass", limit: 4
    t.string "entity_agent_rt", limit: 2
    t.integer "ca_agent_id"
    t.string "ca_agent_name", limit: 70
    t.string "ca_agent_addr_line1", limit: 60
    t.string "ca_agent_addr_line2", limit: 60
    t.string "ca_agent_addr_line3", limit: 60
    t.string "ca_agent_city", limit: 50
    t.string "ca_agent_state", limit: 50
    t.string "ca_agent_country", limit: 5
    t.string "ca_agent_zip", limit: 5
    t.string "ca_agent_zip_cass", limit: 4
    t.string "ca_agent_zip_rt", limit: 2
    t.integer "arb_agent_id"
    t.string "arb_agent_name", limit: 70
    t.string "arb_agent_addr_line1", limit: 60
    t.string "arb_agent_addr_line2", limit: 60
    t.string "arb_agent_addr_line3", limit: 60
    t.string "arb_agent_city", limit: 50
    t.string "arb_agent_state", limit: 50
    t.string "arb_agent_country", limit: 5
    t.string "arb_agent_zip", limit: 5
    t.string "arb_agent_zip_cass", limit: 4
    t.string "arb_agent_zip_rt", limit: 2
    t.string "mineral_type_of_int", limit: 5
    t.string "mineral_int_pct", limit: 15
    t.string "productivity_use_code", limit: 3
    t.integer "timber_78_market"
    t.integer "ag_late_loss"
    t.integer "late_freeport_penalty"
    t.string "dba", limit: 40
    t.integer "market_value"
    t.date "ov65_deferral_date"
    t.date "dp_deferral_date"
    t.string "ref_id1", limit: 25
    t.string "ref_id2", limit: 25
    t.string "situs_num", limit: 15
    t.string "situs_unit", limit: 5
    t.integer "appr_owner_id"
    t.string "appr_owner_name", limit: 70
    t.string "appr_addr_line1", limit: 60
    t.string "appr_addr_line2", limit: 60
    t.string "appr_addr_line3", limit: 60
    t.string "appr_addr_city", limit: 50
    t.string "appr_addr_state", limit: 50
    t.string "appr_addr_country", limit: 5
    t.string "appr_addr_zip", limit: 5
    t.string "appr_addr_zip_cass", limit: 4
    t.string "appr_addr_zip_cass_route", limit: 2
    t.string "appr_ml_deliverable", limit: 1
    t.string "appr_confidential_flag", limit: 1
    t.string "appr_address_suppress_flag", limit: 1
    t.string "appr_confidential_name", limit: 70
    t.string "py_confidential_name", limit: 70
    t.string "jan1_confidential_name", limit: 70
    t.string "rendition_filed", limit: 1
    t.date "rendition_date"
    t.integer "rendition_penalty"
    t.date "rendition_penalty_date_paid"
    t.integer "rendition_fraud_penalty"
    t.date "rendition_fraud_penalty_date_paid"
    t.string "entities", limit: 140
    t.string "eco_exempt", limit: 1
    t.integer "dataset_id"
    t.string "deed_num", limit: 50
    t.string "chodo_exempt", limit: 1
    t.string "local_option_pct_only_flag_hs", limit: 1
    t.string "local_option_pct_only_flag_ov65", limit: 1
    t.string "local_option_pct_only_flag_ov65s", limit: 1
    t.string "local_option_pct_only_flag_dp", limit: 1
    t.string "freeze_only_flag_ov65", limit: 1
    t.string "freeze_only_flag_ov65s", limit: 1
    t.string "freeze_only_flag_dp", limit: 1
    t.string "apply_percent_exemption_flag", limit: 1
    t.integer "exemption_percentage"
    t.string "vit_flag", limit: 1
    t.string "lih_exempt", limit: 1
    t.string "git_exempt", limit: 1
    t.string "dps_exempt", limit: 1
    t.date "dps_deferral_date"
    t.string "local_option_pct_only_flag_dps", limit: 1
    t.string "freeze_only_flag_dps", limit: 1
    t.string "dvhs_exempt", limit: 1
    t.integer "hs_qualify_yr"
    t.integer "ov65_qualify_yr"
    t.integer "ov65s_qualify_yr"
    t.integer "dp_qualify_yr"
    t.integer "dps_qualify_yr"
    t.integer "dv1_qualify_yr"
    t.integer "dv1s_qualify_yr"
    t.integer "dv2_qualify_yr"
    t.integer "dv2s_qualify_yr"
    t.integer "dv3_qualify_yr"
    t.integer "dv3s_qualify_yr"
    t.integer "dv4_qualify_yr"
    t.integer "dv4s_qualify_yr"
    t.integer "dvhs_qualify_yr"
    t.integer "ex_qualify_yr"
    t.integer "ab_qualify_yr"
    t.integer "en_qualify_yr"
    t.integer "fr_qualify_yr"
    t.integer "ht_qualify_yr"
    t.integer "pro_qualify_yr"
    t.integer "pc_qualify_yr"
    t.integer "so_qualify_yr"
    t.integer "ex366_qualify_yr"
    t.integer "ch_qualify_yr"
    t.integer "eco_qualify_yr"
    t.integer "chodo_qualify_yr"
    t.integer "lih_qualify_yr"
    t.integer "git_qualify_yr"
    t.string "mortgage_addr_line1", limit: 60
    t.string "mortgage_addr_line2", limit: 60
    t.string "mortgage_addr_line3", limit: 60
    t.string "mortgage_addr_city", limit: 50
    t.string "mortgage_addr_state", limit: 50
    t.string "mortgage_addr_country", limit: 5
    t.string "mortgage_addr_zip", limit: 5
    t.string "mortgage_addr_zip_cass", limit: 4
    t.string "mortgage_addr_zip_rt", limit: 2
    t.string "mortgage_addr_ml_deliverable", limit: 1
    t.string "sic_code", limit: 10
    t.string "omitted_property_flag", limit: 1
    t.string "hs_prorate_begin", limit: 25
    t.string "hs_prorate_end", limit: 25
    t.string "ov65s_prorate_begin", limit: 25
    t.string "ov65s_prorate_end", limit: 25
    t.string "dp_prorate_begin", limit: 25
    t.string "dp_prorate_end", limit: 25
    t.string "dv1_prorate_begin", limit: 25
    t.string "dv1_prorate_end", limit: 25
    t.string "dv1s_prorate_begin", limit: 25
    t.string "dv1s_prorate_end", limit: 25
    t.string "dv2_prorate_begin", limit: 25
    t.string "dv2_prorate_end", limit: 25
    t.string "dv2s_prorate_begin", limit: 25
    t.string "dv2s_prorate_end", limit: 25
    t.string "dv3_prorate_begin", limit: 25
    t.string "dv3_prorate_end", limit: 25
    t.string "dv3s_prorate_begin", limit: 25
    t.string "dv3s_prorate_end", limit: 25
    t.string "dv4_prorate_begin", limit: 25
    t.string "dv4_prorate_end", limit: 25
    t.string "dv4s_prorate_begin", limit: 25
    t.string "dv4s_prorate_end", limit: 25
    t.string "lve_prorate_begin", limit: 25
    t.string "lve_prorate_end", limit: 25
    t.string "ab_prorate_begin", limit: 25
    t.string "ab_prorate_end", limit: 25
    t.string "en_prorate_begin", limit: 25
    t.string "en_prorate_end", limit: 25
    t.string "fr_prorate_begin", limit: 25
    t.string "fr_prorate_end", limit: 25
    t.string "ht_prorate_begin", limit: 25
    t.string "ht_prorate_end", limit: 25
    t.string "pro_prorate_begin", limit: 25
    t.string "pro_prorate_end", limit: 25
    t.string "pc_prorate_begin", limit: 25
    t.string "pc_prorate_end", limit: 25
    t.string "so_prorate_begin", limit: 25
    t.string "so_prorate_end", limit: 25
    t.string "ex366_prorate_begin", limit: 25
    t.string "ex366_prorate_end", limit: 25
    t.string "ch_prorate_begin", limit: 25
    t.string "ch_prorate_end", limit: 25
    t.string "dps_prorate_begin", limit: 25
    t.string "dps_prorate_end", limit: 25
    t.string "eco_prorate_begin", limit: 25
    t.string "eco_prorate_end", limit: 25
    t.string "chodo_prorate_begin", limit: 25
    t.string "chodo_prorate_end", limit: 25
    t.string "lih_prorate_begin", limit: 25
    t.string "lih_prorate_end", limit: 25
    t.string "git_prorate_begin", limit: 25
    t.string "git_prorate_end", limit: 25
    t.string "clt_exempt", limit: 1
    t.string "clt_prorate_begin", limit: 25
    t.string "clt_prorate_end", limit: 25
    t.integer "clt_qualify_yr"
    t.string "dvhss_exempt", limit: 1
    t.string "dvhss_prorate_begin", limit: 25
    t.string "dvhss_prorate_end", limit: 25
    t.integer "dvhss_qualify_yr"
    t.integer "omitted_imprv_hstd_val"
    t.integer "omitted_imprv_non_hstd_val"
    t.string "dvhs_prorate_begin", limit: 25
    t.string "dvhs_prorate_end", limit: 25
    t.string "ex_xd_exempt", limit: 1
    t.integer "ex_xd_qualify_yr"
    t.string "ex_xd_prorate_begin", limit: 25
    t.string "ex_xd_prorate_end", limit: 25
    t.string "ex_xf_exempt", limit: 1
    t.integer "ex_xf_qualify_yr"
    t.string "ex_xf_prorate_begin", limit: 25
    t.string "ex_xf_prorate_end", limit: 25
    t.string "ex_xg_exempt", limit: 1
    t.integer "ex_xg_qualify_yr"
    t.string "ex_xg_prorate_begin", limit: 25
    t.string "ex_xg_prorate_end", limit: 25
    t.string "ex_xh_exempt", limit: 1
    t.integer "ex_xh_qualify_yr"
    t.string "ex_xh_prorate_begin", limit: 25
    t.string "ex_xh_prorate_end", limit: 25
    t.string "ex_xi_exempt", limit: 1
    t.integer "ex_xi_qualify_yr"
    t.string "ex_xi_prorate_begin", limit: 25
    t.string "ex_xi_prorate_end", limit: 25
    t.string "ex_xj_exempt", limit: 1
    t.integer "ex_xj_qualify_yr"
    t.string "ex_xj_prorate_begin", limit: 25
    t.string "ex_xj_prorate_end", limit: 25
    t.string "ex_xl_exempt", limit: 1
    t.integer "ex_xl_qualify_yr"
    t.string "ex_xl_prorate_begin", limit: 25
    t.string "ex_xl_prorate_end", limit: 25
    t.string "ex_xm_exempt", limit: 1
    t.integer "ex_xm_qualify_yr"
    t.string "ex_xm_prorate_begin", limit: 25
    t.string "ex_xm_prorate_end", limit: 25
    t.string "ex_xn_exempt", limit: 1
    t.integer "ex_xn_qualify_yr"
    t.string "ex_xn_prorate_begin", limit: 25
    t.string "ex_xn_prorate_end", limit: 25
    t.string "ex_xo_exempt", limit: 1
    t.integer "ex_xo_qualify_yr"
    t.string "ex_xo_prorate_begin", limit: 25
    t.string "ex_xo_prorate_end", limit: 25
    t.string "ex_xp_exempt", limit: 1
    t.integer "ex_xp_qualify_yr"
    t.string "ex_xp_prorate_begin", limit: 25
    t.string "ex_xp_prorate_end", limit: 25
    t.string "ex_xq_exempt", limit: 1
    t.integer "ex_xq_qualify_yr"
    t.string "ex_xq_prorate_begin", limit: 25
    t.string "ex_xq_prorate_end", limit: 25
    t.string "ex_xr_exempt", limit: 1
    t.integer "ex_xr_qualify_yr"
    t.string "ex_xr_prorate_begin", limit: 25
    t.string "ex_xr_prorate_end", limit: 25
    t.string "ex_xs_exempt", limit: 1
    t.integer "ex_xs_qualify_yr"
    t.string "ex_xs_prorate_begin", limit: 25
    t.string "ex_xs_prorate_end", limit: 25
    t.string "ex_xt_exempt", limit: 1
    t.integer "ex_xt_qualify_yr"
    t.string "ex_xt_prorate_begin", limit: 25
    t.string "ex_xt_prorate_end", limit: 25
    t.string "ex_xu_exempt", limit: 1
    t.integer "ex_xu_qualify_yr"
    t.string "ex_xu_prorate_begin", limit: 25
    t.string "ex_xu_prorate_end", limit: 25
    t.string "ex_xv_exempt", limit: 1
    t.integer "ex_xv_qualify_yr"
    t.string "ex_xv_prorate_begin", limit: 25
    t.string "ex_xv_prorate_end", limit: 25
    t.string "ex_xa_exempt", limit: 1
    t.integer "ex_xa_qualify_yr"
    t.string "ex_xa_prorate_begin", limit: 25
    t.string "ex_xa_prorate_end", limit: 25
    t.integer "lve_qualify_yr"
    t.string "ppv_exempt", limit: 1
    t.integer "ppv_qualify_yr"
    t.string "ppv_prorate_begin", limit: 25
    t.string "ppv_prorate_end", limit: 25
    t.string "dvch_exempt", limit: 1
    t.integer "dvch_qualify_yr"
    t.string "dvch_prorate_begin", limit: 25
    t.string "dvch_prorate_end", limit: 25
    t.string "dvchs_exempt", limit: 1
    t.integer "dvchs_qualify_yr"
    t.string "dvchs_prorate_begin", limit: 25
    t.string "dvchs_prorate_end", limit: 25
    t.string "masss_exempt", limit: 1
    t.integer "masss_qualify_yr"
    t.string "masss_prorate_begin", limit: 25
    t.string "masss_prorate_end", limit: 25
    t.integer "pp_late_interstate_allocation_val"
    t.integer "appraised_val_reflecting_productivity_loss"
    t.integer "assessed_val_reflecting_productivity_loss"
    t.string "frss_exempt", limit: 1
    t.integer "frss_qualify_yr"
    t.string "frss_prorate_begin", limit: 25
    t.string "frss_prorate_end", limit: 25
    t.string "abmno_exempt", limit: 1
    t.integer "abmno_qualify_yr"
    t.string "abmno_prorate_begin", limit: 25
    t.string "abmno_prorate_end", limit: 25
    t.date "dv1_deferral_date"
    t.date "dv2_deferral_date"
    t.date "dv3_deferral_date"
    t.date "dv4_deferral_date"
    t.date "dv1s_deferral_date"
    t.date "dv2s_deferral_date"
    t.date "dv3s_deferral_date"
    t.date "dv4s_deferral_date"
    t.string "dis_exempt", limit: 1
    t.integer "dis_qualify_yr"
    t.string "dis_prorate_begin", limit: 25
    t.string "dis_prorate_end", limit: 25
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "state_cds", force: :cascade do |t|
    t.string "state_cd", limit: 10
    t.string "state_cd_description", limit: 50
    t.string "ptd_state_cd", limit: 10
    t.string "ptd_state_cd_description", limit: 50
    t.string "state_cd_year", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
